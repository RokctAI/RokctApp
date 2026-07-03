import os
import re

pattern = re.compile(r"import\s+[\'\"]package:merchants_sdk/(.*)[\"\']")

for root, _, files in os.walk("sdk"):
    for file in files:
        if file.endswith(".dart") and "templates" in root:
            path = os.path.join(root, file)
            try:
                with open(path, "r", encoding="utf-8") as f:
                    content = f.read()
                    matches = pattern.findall(content)
                    for m in matches:
                        print(f"{path} -> {m}")
            except Exception as e:
                print(f"Error reading {path}: {e}")
