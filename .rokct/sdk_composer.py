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

def check_git_availability(git_url):
    try:
        # Use git ls-remote to check if the repository is reachable without downloading it
        result = subprocess.run(
            ["git", "ls-remote", "--exit-code", "-h", git_url, "HEAD"],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
            timeout=5
        )
        return result.returncode == 0
    except Exception:
        return False

def resolve_active_path(sdk_config):
    if not isinstance(sdk_config, dict):
        return os.path.abspath(os.path.join(PROJECT_ROOT, "sdk", sdk_config))
        
    sdk_name = sdk_config["name"]
    local_path = sdk_config.get("path")
    git_url = sdk_config.get("git")
    ref = sdk_config.get("ref", "main")
    
    if git_url:
        print(f"[*] Checking availability of remote repository for {sdk_name}...")
        if check_git_availability(git_url):
            cache_dir = os.path.abspath(os.path.join(PROJECT_ROOT, ".rokct", "cache", sdk_name))
            print(f"[+] Remote repository available. Cloning/updating into cache: {cache_dir}")
            try:
                os.makedirs(os.path.dirname(cache_dir), exist_ok=True)
                if os.path.exists(cache_dir):
                    subprocess.run(["git", "fetch"], cwd=cache_dir, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
                    subprocess.run(["git", "checkout", ref], cwd=cache_dir, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
                    subprocess.run(["git", "pull", "origin", ref], cwd=cache_dir, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
                else:
                    subprocess.run(["git", "clone", "-b", ref, "--depth", "1", git_url, cache_dir], check=True)
                return cache_dir
            except Exception as e:
                print(f"[!] Error syncing git repository: {e}. Falling back to local path.")
        else:
            print(f"[!] Remote repository for {sdk_name} not available yet. Falling back to local path.")
            
    if local_path:
        return os.path.abspath(os.path.join(PROJECT_ROOT, local_path))
        
    return os.path.abspath(os.path.join(PROJECT_ROOT, "sdk", sdk_name))

def run_installer(sdk_config):
    sdk_name = sdk_config["name"] if isinstance(sdk_config, dict) else sdk_config
    sdk_path = resolve_active_path(sdk_config)
    
    installer_script = os.path.join(sdk_path, "install.py")
    
    if not os.path.exists(installer_script):
        print(f"[-] No install.py found for SDK: {sdk_name} at {sdk_path}. Skipping.")
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
        
        new_lines = lines[:dependencies_start + 1]
        
        i = dependencies_start + 1
        while i < len(lines):
            line = lines[i]
            if line.startswith(" "):
                stripped = line.strip()
                if stripped and stripped.endswith("_sdk:"):
                    i += 1
                    while i < len(lines) and (lines[i].startswith(" ") or lines[i].strip() == ""):
                        i += 1
                    continue
                else:
                    new_lines.append(line)
            elif line.strip() == "":
                new_lines.append(line)
            else:
                new_lines.extend(lines[i:])
                i = len(lines)
                break
            i += 1
        
        # Now add the SDKs from composer.json
        sdk_deps = []
        for sdk in sdks:
            sdk_name = sdk["name"] if isinstance(sdk, dict) else sdk
            resolved_path = resolve_active_path(sdk)
            
            pubspec_path_val = resolved_path
            try:
                pubspec_path_val = os.path.relpath(resolved_path, PROJECT_ROOT).replace("\\", "/")
            except ValueError:
                pass
            
            if os.path.exists(os.path.join(resolved_path, "pubspec.yaml")):
                sdk_deps.append(f"  {sdk_name}:\n    path: {pubspec_path_val}\n")
            else:
                print(f"  [-] Skipping {sdk_name} as pubspec.yaml is missing at {resolved_path}.")
        
        if sdk_deps:
            new_lines.insert(dependencies_start + 1, "".join(sdk_deps))
            
        with open(pubspec_path, "w", encoding="utf-8") as f:
            f.writelines(new_lines)
        print(f"[*] Updated SDK dependencies in pubspec.yaml")
    except Exception as e:
        print(f"[!] Error updating pubspec.yaml dependencies: {e}")

def main():
    composer_path = os.path.join(PROJECT_ROOT, "composer.json")
    package_name = None
    sdks_to_install = []
    
    if len(sys.argv) < 2:
        if os.path.exists(composer_path):
            try:
                with open(composer_path, "r", encoding="utf-8") as f:
                    config = json.load(f)
                sdks = [s for s in config.get("sdks", []) if isinstance(s, dict) and s.get("enabled", True)]
                package_name = config.get("package_name")
                print(f"[*] Reading active SDK list from composer.json: {sdks}")
                sdks_to_install = sdks
            except Exception as e:
                print(f"[!] Error reading composer.json: {e}. Resolving all packages.")
                sdks_to_install = resolve_sdk_path()
        else:
            sdks_to_install = resolve_sdk_path()
            
        if not sdks_to_install:
            print("[-] No SDKs found to install.")
            sys.exit(1)
            
        if "core_sdk" in [s["name"] if isinstance(s, dict) else s for s in sdks_to_install]:
            core_idx = -1
            for i, s in enumerate(sdks_to_install):
                if (isinstance(s, dict) and s["name"] == "core_sdk") or s == "core_sdk":
                    core_idx = i
                    break
            if core_idx != -1:
                core_sdk = sdks_to_install.pop(core_idx)
                sdks_to_install.insert(0, core_sdk)
                
        for sdk in sdks_to_install:
            run_installer(sdk)
    else:
        requested_sdks = sys.argv[1:]
        if "core_sdk" in requested_sdks:
            requested_sdks.remove("core_sdk")
            requested_sdks.insert(0, "core_sdk")
        for sdk in requested_sdks:
            run_installer(sdk)

    if package_name:
        update_pubspec_name(package_name)
    
    if sdks_to_install:
        update_pubspec_dependencies(sdks_to_install)

if __name__ == "__main__":
    main()
