
import os
import glob

target_dir = "lib/manager"
replacements = {
    "package:merchants_sdk/src/presentation/pages/main/foods/extras/extras_body.dart": "package:manager/presentation/pages/main/foods/extras/extras_body.dart",
    "package:merchants_sdk/src/presentation/pages/main/foods/addons/addons_body.dart": "package:manager/presentation/pages/main/foods/addons/addons_body.dart",
    "package:merchants_sdk/src/presentation/pages/main/foods/widgets/foods_filter_item.dart": "package:manager/presentation/pages/main/foods/widgets/foods_filter_item.dart",
    "package:merchants_sdk/src/application/providers.dart": "package:products_sdk/products_sdk.dart", # For foods files
}

for filepath in glob.glob(os.path.join(target_dir, "**/*.dart"), recursive=True):
    if "foods" in filepath:
        try:
            with open(filepath, "r", encoding="utf-8") as f:
                content = f.read()
            
            new_content = content
            for old, new in replacements.items():
                new_content = new_content.replace(old, new)
            
            if new_content != content:
                with open(filepath, "w", encoding="utf-8") as f:
                    f.write(new_content)
                print(f"Updated {filepath}")
        except Exception as e:
            print(f"Error updating {filepath}: {e}")

