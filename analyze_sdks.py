import os
import subprocess
import sys

PROJECT_ROOT = os.getcwd()
SDK_DIR = os.path.join(PROJECT_ROOT, "sdk")

def analyze_sdks():
    if not os.path.exists(SDK_DIR):
        print(f"[-] SDK directory not found: {SDK_DIR}")
        return

    sdks = [d for d in os.listdir(SDK_DIR) if os.path.isdir(os.path.join(SDK_DIR, d))]
    print(f"[+] Found {len(sdks)} SDKs to analyze.\n")

    failures = []
    successes = []

    for sdk in sdks:
        sdk_path = os.path.join(SDK_DIR, sdk)
        pubspec_path = os.path.join(sdk_path, "pubspec.yaml")
        if not os.path.exists(pubspec_path):
            continue

        print(f"==================================================")
        print(f"[*] Analyzing SDK: {sdk}")
        print(f"==================================================")

        # Run pub get first to ensure packages are resolved
        subprocess.run(["flutter", "pub", "get"], cwd=sdk_path, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, shell=True)

        # Run analyze
        result = subprocess.run(["flutter", "analyze"], cwd=sdk_path, capture_output=True, text=True, shell=True)
        if result.returncode == 0:
            print(f"[+] {sdk} passed analysis.")
            successes.append(sdk)
        else:
            print(f"[-] {sdk} failed analysis.")
            print(result.stdout)
            failures.append(sdk)

    print("\n========================= SUMMARY =========================")
    print(f"Passed ({len(successes)}): {', '.join(successes)}")
    if failures:
        print(f"Failed ({len(failures)}): {', '.join(failures)}")
        sys.exit(1)
    else:
        print("[+] All SDKs passed analysis cleanly!")

if __name__ == "__main__":
    analyze_sdks()
