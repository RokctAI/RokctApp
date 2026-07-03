
import os
from collections import defaultdict

components = ["LoadingGrid", "NoDataInfo", "CustomAppBar", "SecondButton", "CircleButton", "CustomButton", "SearchTextField", "Loading"]
usage = defaultdict(set)

for root, _, files in os.walk("sdk"):
    for file in files:
        if file.endswith(".dart"):
            path = os.path.join(root, file)
            try:
                with open(path, "r", encoding="utf-8") as f:
                    content = f.read()
                    for c in components:
                        if c in content:
                            # Determine which SDK this belongs to
                            parts = path.split(os.sep)
                            if "sdk" in parts:
                                idx = parts.index("sdk")
                                if idx + 1 < len(parts):
                                    sdk_name = parts[idx+1]
                                    usage[c].add(sdk_name)
            except Exception as e:
                print(f"Error reading {path}: {e}")

for c in components:
    print(f"{c}: {list(usage[c])}")

