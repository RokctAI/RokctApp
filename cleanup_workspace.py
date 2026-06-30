import os
import subprocess

def cleanup():
    print("[*] Cleaning up unstaged changes...")
    try:
        subprocess.run(["git", "restore", "."], check=True)
        print("[+] Unstaged changes cleared.")
    except subprocess.CalledProcessError as e:
        print(f"[-] Failed to clear unstaged changes: {e}")

    print("[*] Deleting empty folders...")
    deleted_count = 0
    for root, dirs, files in os.walk(".", topdown=False):
        for name in dirs:
            full_path = os.path.join(root, name)
            # Avoid deleting .git or other critical directories
            if ".git" in full_path or ".rokct" in full_path:
                continue
                
            try:
                if not os.listdir(full_path):
                    os.rmdir(full_path)
                    print(f"[+] Deleted empty folder: {full_path}")
                    deleted_count += 1
            except Exception as e:
                print(f"[-] Could not delete {full_path}: {e}")
    
    print(f"[*] Total empty folders deleted: {deleted_count}")

if __name__ == "__main__":
    cleanup()
