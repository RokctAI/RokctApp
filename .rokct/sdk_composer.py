import os
import sys
import subprocess
import json

PROJECT_ROOT = os.getcwd()

def resolve_sdk_path():
    config_path = os.path.join(PROJECT_ROOT, ".dart_tool", "package_config.json")
    sdks = []
    if os.path.exists(config_path):
        try:
            with open(config_path, "r", encoding="utf-8") as f:
                config = json.load(f)
                packages = config.get("packages", [])
                sdks = [pkg.get("name") for pkg in packages if pkg.get("name", "").endswith("_sdk")]
        except Exception as e:
            print(f"[!] Error reading package_config.json: {e}")
    
    # Also include local sdk/ directory for monorepo development
    sdk_root = os.path.join(PROJECT_ROOT, "sdk")
    if os.path.isdir(sdk_root):
        local_sdks = [d for d in os.listdir(sdk_root) if os.path.isdir(os.path.join(sdk_root, d))]
        sdks.extend(local_sdks)
    
    return sorted(list(set(sdks)))

def run_installer(sdk_name):
    # Use the same resolution logic as installer_base to find install.py
    package_config_path = os.path.join(PROJECT_ROOT, ".dart_tool", "package_config.json")
    sdk_path = None
    if os.path.exists(package_config_path):
        try:
            with open(package_config_path, "r", encoding="utf-8") as f:
                config = json.load(f)
                packages = config.get("packages", [])
                for pkg in packages:
                    if pkg.get("name") == sdk_name:
                        root_uri = pkg.get("rootUri")
                        if root_uri:
                            if root_uri.startswith("file:///"):
                                sdk_path = root_uri.replace("file:///", "").replace("/", os.sep)
                            elif root_uri.startswith(".."):
                                sdk_path = os.path.abspath(os.path.join(PROJECT_ROOT, ".dart_tool", root_uri))
                            else:
                                sdk_path = root_uri
                            break
        except:
            pass
    
    if not sdk_path:
        sdk_path = os.path.join(PROJECT_ROOT, "sdk", sdk_name)
        
    installer_script = os.path.join(sdk_path, "install.py")
    
    if not os.path.exists(installer_script):
        print(f"[-] No install.py found for SDK: {sdk_name}. Skipping.")
        return
        
    print(f"\n[*] Executing Installer for {sdk_name}...")
    try:
        result = subprocess.run(
            [sys.executable, installer_script],
            cwd=PROJECT_ROOT,
            capture_output=True,
            text=True,
            check=True
        )
        print(f"[+] Installer for {sdk_name} completed successfully.")
    except subprocess.CalledProcessError as e:
        log_dir = os.path.join(PROJECT_ROOT, ".rokct", "agent", "logs")
        os.makedirs(log_dir, exist_ok=True)
        log_file = os.path.join(log_dir, f"{sdk_name}_install_error.log")
        with open(log_file, "w", encoding="utf-8") as lf:
            lf.write(f"Command: {' '.join(e.cmd)}\n")
            lf.write(f"Exit Code: {e.returncode}\n")
            lf.write(f"Stdout:\n{e.stdout}\n")
            lf.write(f"Stderr:\n{e.stderr}\n")
        print(f"[!] Installer for {sdk_name} failed. Error log written to: .rokct/agent/logs/{sdk_name}_install_error.log")
        sys.exit(1)

def update_pubspec_name(package_name):
    pubspec_path = os.path.join(PROJECT_ROOT, "pubspec.yaml")
    if not os.path.exists(pubspec_path):
        return
    
    try:
        with open(pubspec_path, "r", encoding="utf-8") as f:
            lines = f.readlines()
        
        updated = False
        with open(pubspec_path, "w", encoding="utf-8") as f:
            for line in lines:
                if line.startswith("name:"):
                    f.write(f"name: {package_name}\n")
                    updated = True
                else:
                    f.write(line)
        if updated:
            print(f"[*] Updated pubspec.yaml name to: {package_name}")
    except Exception as e:
        print(f"[!] Error updating pubspec.yaml name: {e}")

def update_pubspec_dependencies(sdks):
    pubspec_path = os.path.join(PROJECT_ROOT, "pubspec.yaml")
    if not os.path.exists(pubspec_path):
        return
    
    try:
        with open(pubspec_path, "r", encoding="utf-8") as f:
            lines = f.readlines()
        
        dependencies_start = -1
        for i, line in enumerate(lines):
            if line.strip() == "dependencies:":
                dependencies_start = i
                break
        
        if dependencies_start == -1:
            print("[!] Could not find 'dependencies:' section in pubspec.yaml")
            return

        # Extract current dependencies to avoid duplicates
        current_deps = set()
        for line in lines[dependencies_start+1:]:
            if line.startswith(" "):
                dep = line.strip().split(":")[0]
                current_deps.add(dep)
            elif line.strip() == "" or not line.startswith(" "):
                break

        new_deps = []
        for sdk in sdks:
            sdk_name = sdk["name"] if isinstance(sdk, dict) else sdk
            # Only add if pubspec.yaml exists in the SDK directory
            sdk_pubspec = os.path.join(PROJECT_ROOT, "sdk", sdk_name, "pubspec.yaml")
            if os.path.exists(sdk_pubspec):
                if sdk_name not in current_deps:
                    new_deps.append(f"  {sdk_name}:\n    path: sdk/{sdk_name}\n")
            else:
                print(f"  [-] Skipping {sdk_name} as pubspec.yaml is missing.")

        if not new_deps:
            return

        # Insert new dependencies after 'dependencies:'
        lines.insert(dependencies_start + 1, "".join(new_deps))
        
        with open(pubspec_path, "w", encoding="utf-8") as f:
            f.writelines(lines)
        print(f"[*] Added {len(new_deps)} SDK dependencies to pubspec.yaml")
    except Exception as e:
        print(f"[!] Error updating pubspec.yaml dependencies: {e}")

def main():
    composer_path = os.path.join(PROJECT_ROOT, "composer.json")
    package_name = None
    sdks_to_install = []
    
    if len(sys.argv) < 2:
        if os.path.exists(composer_path):
            # Read active SDKs from composer.json configuration
            try:
                with open(composer_path, "r", encoding="utf-8") as f:
                    config = json.load(f)
                    sdks = config.get("sdks", [])
                    package_name = config.get("package_name")
                print(f"[*] Reading active SDK list from composer.json: {sdks}")
                sdks_to_install = sdks
            except Exception as e:
                print(f"[!] Error reading composer.json: {e}. Resolving all packages.")
                sdks_to_install = resolve_sdk_path()
        else:
            # Fallback to resolving all available SDKs
            sdks_to_install = resolve_sdk_path()
            
        if not sdks_to_install:
            print("[-] No SDKs found to install.")
            sys.exit(1)
            
        # Ensure core_sdk is always sorted and installed first
        if "core_sdk" in [s["name"] if isinstance(s, dict) else s for s in sdks_to_install]:
            # Handle both list of strings and list of dicts
            core_idx = -1
            for i, s in enumerate(sdks_to_install):
                if (isinstance(s, dict) and s["name"] == "core_sdk") or s == "core_sdk":
                    core_idx = i
                    break
            if core_idx != -1:
                core_sdk = sdks_to_install.pop(core_idx)
                sdks_to_install.insert(0, core_sdk)
                
        for sdk in sdks_to_install:
            sdk_name = sdk["name"] if isinstance(sdk, dict) else sdk
            run_installer(sdk_name)
    else:
        # Run installer for specified SDK lists
        requested_sdks = sys.argv[1:]
        if "core_sdk" in requested_sdks:
            requested_sdks.remove("core_sdk")
            requested_sdks.insert(0, "core_sdk")
        for sdk in requested_sdks:
            sdk_name = sdk["name"] if isinstance(sdk, dict) else sdk
            run_installer(sdk_name)

    if package_name:
        update_pubspec_name(package_name)
    
    if sdks_to_install:
        update_pubspec_dependencies(sdks_to_install)


if __name__ == "__main__":
    main()
