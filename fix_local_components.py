import os
import glob

target_dir = "lib/manager"

for filepath in glob.glob(os.path.join(target_dir, "**/*.dart"), recursive=True):
    try:
        with open(filepath, "r", encoding="utf-8") as f:
            content = f.read()
        
        new_content = content
        
        # Fix the specific component imports
        if "CustomAppBar" in content and "package:manager/core/presentation/components/manager/custom_app_bar.dart" not in content:
            lines = new_content.splitlines()
            import_pos = 0
            for i, line in enumerate(lines):
                if line.startswith("import "): import_pos = i + 1
            lines.insert(import_pos, "import 'package:manager/core/presentation/components/manager/custom_app_bar.dart';")
            new_content = "\n".join(lines)

        if "LoadingList" in content and "package:manager/core/presentation/components/manager/loading/loading_list.dart" not in content:
            lines = new_content.splitlines()
            import_pos = 0
            for i, line in enumerate(lines):
                if line.startswith("import "): import_pos = i + 1
            lines.insert(import_pos, "import 'package:manager/core/presentation/components/manager/loading/loading_list.dart';")
            new_content = "\n".join(lines)

        if "OrderItem" in content and "package:manager/core/presentation/components/manager/list_items/order_item.dart" not in content:
            lines = new_content.splitlines()
            import_pos = 0
            for i, line in enumerate(lines):
                if line.startswith("import "): import_pos = i + 1
            lines.insert(import_pos, "import 'package:manager/core/presentation/components/manager/list_items/order_item.dart';")
            new_content = "\n".join(lines)

        if new_content != content:
            with open(filepath, "w", encoding="utf-8") as f:
                f.write(new_content)
            print(f"Updated imports in {filepath}")
    except Exception as e:
        print(f"Error processing {filepath}: {e}")
