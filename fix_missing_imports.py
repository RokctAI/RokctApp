import os
import glob

target_dir = "lib/manager"
needed_import = "import 'package:core_sdk/core_sdk.dart';"

for filepath in glob.glob(os.path.join(target_dir, "**/*.dart"), recursive=True):
    try:
        with open(filepath, "r", encoding="utf-8") as f:
            content = f.read()
        
        if ("AppHelpers" in content or "TrKeys" in content) and needed_import not in content:
            lines = content.splitlines()
            import_pos = 0
            for i, line in enumerate(lines):
                if line.startswith("import "):
                    import_pos = i + 1
                elif line.strip() == "":
                    continue
                else:
                    break
            
            lines.insert(import_pos, needed_import)
            new_content = "\n".join(lines)
            
            with open(filepath, "w", encoding="utf-8") as f:
                f.write(new_content)
            print(f"Added core_sdk import to {filepath}")
    except Exception as e:
        print(f"Error processing {filepath}: {e}")
