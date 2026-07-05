
import os
import glob

target_dir = "lib/manager"
replacements = {
    "package:merchants_sdk/src/application/providers.dart": "package:orders_sdk/orders_sdk.dart",
    "package:merchants_sdk/src/presentation/pages/main/orders/widgets/no_orders.dart": "package:manager/presentation/pages/main/orders/widgets/no_orders.dart",
    "package:merchants_sdk/src/presentation/pages/main/orders/details/order_details_modal.dart": "package:manager/presentation/pages/main/orders/details/order_details_modal.dart",
    "package:merchants_sdk/src/presentation/pages/main/orders/widgets/ready_orders_body.dart": "package:manager/presentation/pages/main/orders/widgets/ready_orders_body.dart",
    "package:merchants_sdk/src/presentation/pages/main/orders/widgets/on_a_way_orders_body.dart": "package:manager/presentation/pages/main/orders/widgets/on_a_way_orders_body.dart",
    "package:merchants_sdk/src/presentation/pages/main/orders/widgets/new_orders_body.dart": "package:manager/presentation/pages/main/orders/widgets/new_orders_body.dart",
    "package:merchants_sdk/src/presentation/pages/main/orders/widgets/cooking_orders_body.dart": "package:manager/presentation/pages/main/orders/widgets/cooking_orders_body.dart",
    "package:merchants_sdk/src/presentation/pages/main/orders/widgets/accepted_orders_body.dart": "package:manager/presentation/pages/main/orders/widgets/accepted_orders_body.dart",
    "package:merchants_sdk/src/presentation/pages/main/orders/details/image_dialog.dart": "package:manager/presentation/pages/main/orders/details/image_dialog.dart",
    "package:merchants_sdk/src/presentation/pages/main/orders/details/price_information.dart": "package:manager/presentation/pages/main/orders/details/price_information.dart",
    "package:merchants_sdk/src/presentation/pages/main/orders/orders_home_page.dart": "package:manager/presentation/pages/main/orders/orders_home_page.dart",
}

for filepath in glob.glob(os.path.join(target_dir, "**/*.dart"), recursive=True):
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

