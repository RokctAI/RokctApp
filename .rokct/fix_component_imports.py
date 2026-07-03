
import os

replacements = {
    "package:merchants_sdk/src/presentation/component/custom_app_bar.dart": "package:core_sdk/src/presentation/components/app_bars/custom_app_bar.dart",
    "package:merchants_sdk/src/presentation/component/helper/no_data_info.dart": "package:core_sdk/src/presentation/components/helper/no_data_info.dart",
    "package:merchants_sdk/src/presentation/component/loading/loading_grid.dart": "package:core_sdk/src/presentation/components/loading/loading_grid.dart",
    "package:merchants_sdk/src/presentation/component/buttons/second_button.dart": "package:core_sdk/src/presentation/components/buttons/second_button.dart",
    "package:merchants_sdk/src/presentation/component/buttons/circle_button.dart": "package:core_sdk/src/presentation/components/buttons/circle_button.dart",
    "package:merchants_sdk/src/presentation/component/buttons/custom_button.dart": "package:core_sdk/src/presentation/components/buttons/custom_button.dart",
    "package:merchants_sdk/src/presentation/component/text_fields/search_text_field.dart": "package:core_sdk/src/presentation/components/text_fields/search_text_field.dart",
    "package:merchants_sdk/src/presentation/component/loading/loading.dart": "package:core_sdk/src/presentation/components/loading.dart",
    "package:merchants_sdk/src/presentation/component/components.dart": "package:core_sdk/src/presentation/components/components.dart",
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
                        print(f"Fixed component imports in {path}")
                except Exception as e:
                    print(f"Error processing {path}: {e}")

if __name__ == "__main__":
    fix_imports("sdk")

