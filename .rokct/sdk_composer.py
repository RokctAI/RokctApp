import os
import sys
import subprocess

PROJECT_ROOT = os.getcwd()

def run_installer(sdk_name):
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
    sdk_root = os.path.join(PROJECT_ROOT, "sdk")
    if not os.path.isdir(sdk_root):
        print("[-] sdk directory not found.")
        sys.exit(1)
        
    if len(sys.argv) < 2:
        # Run installers for all SDKs in /sdk/
        sdks = [d for d in os.listdir(sdk_root) if os.path.isdir(os.path.join(sdk_root, d))]
        for sdk in sdks:
            run_installer(sdk)
    else:
        # Run installer for specified SDK lists
        for sdk in sys.argv[1:]:
            run_installer(sdk)

if __name__ == "__main__":
    main()
