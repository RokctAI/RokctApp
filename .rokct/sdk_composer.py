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
            capture_output=False,
            text=True,
            check=True
        )
        print(f"[+] Installer for {sdk_name} completed successfully.")
    except subprocess.CalledProcessError as e:
        print(f"[!] Installer for {sdk_name} failed: {e}")
        sys.exit(1)

def main():
    if len(sys.argv) < 2:
        # Resolve all available SDKs from pub cache and local folder
        sdks = resolve_sdk_path()
        if not sdks:
            print("[-] No SDKs found in .dart_tool/package_config.json or sdk/ directory.")
            sys.exit(1)
        for sdk in sdks:
            run_installer(sdk)
    else:
        # Run installer for specified SDK lists
        for sdk in sys.argv[1:]:
            run_installer(sdk)

if __name__ == "__main__":
    main()
