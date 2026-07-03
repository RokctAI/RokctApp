
import os

replacements = {
    "package:merchants_sdk/src/infrastructure/services/app_helpers.dart": "package:core_sdk/src/infrastructure/utils/manager/app_helpers.dart",
    "package:merchants_sdk/src/infrastructure/services/local_storage.dart": "package:core_sdk/src/infrastructure/utils/manager/local_storage.dart",
    "package:merchants_sdk/src/infrastructure/services/tr_keys.dart": "package:core_sdk/src/infrastructure/constants/tr_keys.dart",
    "package:merchants_sdk/src/infrastructure/services/date_service.dart": "package:core_sdk/src/infrastructure/utils/manager/date_service.dart",
}

def fix_imports(directory):
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith(".dart"):
                path = os.path.join(root, file)
                try:
                    with open(path, "r", encoding="utf-8") as f:
                        content = f.read()
                    
                    new_content = content
                    for old, new in replacements.items():
                        new_content = new_content.replace(old, new)
                    
                    if new_content != content:
                        with open(path, "w", encoding="utf-8") as f:
                            f.write(new_content)
                        print(f"Fixed imports in {path}")
                except Exception as e:
                    print(f"Error processing {path}: {e}")

if __name__ == "__main__":
    fix_imports("sdk")

