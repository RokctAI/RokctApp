import os
import re

base_path = r"C:\Users\sinya\Desktop\RokctAI\RokctApp"

# 1. Getter definitions for each SDK to append to entrypoints
sdk_getters = {
    "auth_sdk": """
// Global DI Getters
AuthRepositoryFacade get authRepository => GetIt.instance.get<AuthRepositoryFacade>();
driver_auth_int.AuthRepository get driverAuthRepository => GetIt.instance.get<driver_auth_int.AuthRepository>();
AuthInterface get managerAuthRepository => GetIt.instance.get<AuthInterface>();
""",
    "profile_sdk": """
// Global DI Getters
SettingsRepositoryFacade get settingsRepository => GetIt.instance.get<SettingsRepositoryFacade>();
UserRepositoryFacade get userRepository => GetIt.instance.get<UserRepositoryFacade>();
AddressRepositoryFacade get selectAddressRepository => GetIt.instance.get<AddressRepositoryFacade>();
driver_settings_int.DriverSettingsRepository get driverSettingsRepository => GetIt.instance.get<driver_settings_int.DriverSettingsRepository>();
driver_user_int.DriverUserRepository get driverUserRepository => GetIt.instance.get<driver_user_int.DriverUserRepository>();
UsersInterface get managerUserRepository => GetIt.instance.get<UsersInterface>();
SettingsInterface get managerSettingsRepository => GetIt.instance.get<SettingsInterface>();
""",
    "order_sdk": """
// Global DI Getters
ProductsRepositoryFacade get productsRepository => GetIt.instance.get<ProductsRepositoryFacade>();
ShopsRepositoryFacade get shopsRepository => GetIt.instance.get<ShopsRepositoryFacade>();
CategoriesRepositoryFacade get categoriesRepository => GetIt.instance.get<CategoriesRepositoryFacade>();
BrandsRepositoryFacade get brandsRepository => GetIt.instance.get<BrandsRepositoryFacade>();
OrdersInterface get ordersRepository => GetIt.instance.get<OrdersInterface>();
BannersRepositoryFacade get bannersRepository => GetIt.instance.get<BannersRepositoryFacade>();
BlogsRepositoryFacade get blogsRepository => GetIt.instance.get<BlogsRepositoryFacade>();
CartRepositoryFacade get cartRepository => GetIt.instance.get<CartRepositoryFacade>();
driver_orders_int.DriverOrdersRepository get driverOrdersRepository => GetIt.instance.get<driver_orders_int.DriverOrdersRepository>();
TableInterface get managerTableRepository => GetIt.instance.get<TableInterface>();
ShopsInterface get managerShopsRepository => GetIt.instance.get<ShopsInterface>();
manager_orders_int.OrdersInterface get managerOrdersRepository => GetIt.instance.get<manager_orders_int.OrdersInterface>();
CatalogInterface get managerCatalogRepository => GetIt.instance.get<CatalogInterface>();
ProductsInterface get managerProductsRepository => GetIt.instance.get<ProductsInterface>();
SubscriptionsFacade get managerSubscriptionsRepository => GetIt.instance.get<SubscriptionsFacade>();
""",
    "delivery_sdk": """
// Global DI Getters
ParcelRepositoryFacade get parcelRepository => GetIt.instance.get<ParcelRepositoryFacade>();
driver_parcel_int.DriverParcelRepository get driverParcelRepository => GetIt.instance.get<driver_parcel_int.DriverParcelRepository>();
""",
    "wallet_sdk": """
// Global DI Getters
PaymentsRepositoryFacade get walletRepository => GetIt.instance.get<PaymentsRepositoryFacade>();
PaymentsFacade get managerPaymentsRepository => GetIt.instance.get<PaymentsFacade>();
""",
    "comms_sdk": """
// Global DI Getters
NotificationRepositoryFacade get notificationRepo => GetIt.instance.get<NotificationRepositoryFacade>();
driver_notif_int.DriverNotificationRepository get driverNotificationRepository => GetIt.instance.get<driver_notif_int.DriverNotificationRepository>();
NotificationInterface get managerNotificationRepository => GetIt.instance.get<NotificationInterface>();
""",
    "shared_sdk": """
// Global DI Getters
DrawRepositoryFacade get drawRepository => GetIt.instance.get<DrawRepositoryFacade>();
CurrenciesRepositoryFacade get currenciesRepository => GetIt.instance.get<CurrenciesRepositoryFacade>();
driver_draw_int.DriverDrawRepository get driverDrawRepository => GetIt.instance.get<driver_draw_int.DriverDrawRepository>();
"""
}

# Add dependencies to entrypoints so GetIt is available in them
for sdk, getters_code in sdk_getters.items():
    entry_path = os.path.join(base_path, "sdk", sdk, "lib", f"{sdk}.dart")
    if os.path.exists(entry_path):
        with open(entry_path, "r", encoding="utf-8") as f:
            content = f.read()
            
        imports = "import 'package:get_it/get_it.dart';\n"
        if "package:get_it/get_it.dart" not in content:
            content = imports + content
            
        if "Global DI Getters" not in content:
            content += getters_code
            with open(entry_path, "w", encoding="utf-8") as f:
                f.write(content)
            print(f"[+] Added global getters and GetIt import to {sdk}.dart")

# 2. Overwrite dependency_manager.dart to be completely decoupled
dep_mgr_path = os.path.join(base_path, "lib", "core", "domain", "di", "dependency_manager.dart")
decoupled_dep_mgr = """import 'package:get_it/get_it.dart';
import 'package:google_place/google_place.dart';
import 'package:rokctapp/core/presentation/routes/app_router.dart';
import 'package:shared_sdk/shared_sdk.dart';

final getIt = GetIt.instance;

class DependencyManager {
  static void registerCore() {
    // Core App Shell registrations only
    getIt.registerSingleton<AppRouter>(AppRouter());
    getIt.registerLazySingleton<HttpService>(() => HttpService());
    getIt.registerSingleton<GooglePlace>(GooglePlace(AppConstants.googleApiKey));
    getIt.registerSingleton<Map>(LocalStorage.getTranslations());
  }
}

// Universal Global Accessors
final appDatabase = AppDatabase();
final dioHttp = getIt.get<HttpService>();
"""

with open(dep_mgr_path, "w", encoding="utf-8") as f:
    f.write(decoupled_dep_mgr)
print("[+] Decoupled lib/core/domain/di/dependency_manager.dart successfully.")

# 3. Modify lib/main.dart to import SDKs and define setUpDependencies
main_path = os.path.join(base_path, "lib", "main.dart")
if os.path.exists(main_path):
    with open(main_path, "r", encoding="utf-8") as f:
        content = f.read()
        
    # Append SDK imports at the top
    sdk_imports = """
import 'package:get_it/get_it.dart';
import 'package:shared_sdk/shared_sdk.dart';
import 'package:auth_sdk/auth_sdk.dart';
import 'package:profile_sdk/profile_sdk.dart';
import 'package:order_sdk/order_sdk.dart';
import 'package:wallet_sdk/wallet_sdk.dart';
import 'package:delivery_sdk/delivery_sdk.dart';
import 'package:comms_sdk/comms_sdk.dart';
"""
    if "import 'package:shared_sdk/shared_sdk.dart';" not in content:
        # Find where to place imports (e.g. after geolocation / constants imports)
        content = re.sub(
            r"(import 'package:rokctapp/core/presentation/app_widget.dart';)",
            r"\1" + sdk_imports,
            content
        )
        
    # Define setUpDependencies() at the end or replace it if exists
    setup_func = """
Future<void> setUpDependencies() async {
  // 1. Initialize core app shell dependencies
  DependencyManager.registerCore();

  // 2. Initialize SDK specific dependencies
  final getIt = GetIt.instance;
  SharedSdkDependencies.register(getIt);
  AuthSdkDependencies.register(getIt);
  ProfileSdkDependencies.register(getIt);
  OrderSdkDependencies.register(getIt);
  WalletSdkDependencies.register(getIt);
  DeliverySdkDependencies.register(getIt);
  CommsSdkDependencies.register(getIt);
}
"""
    # Replace setUpDependencies if defined inside main or append
    if "Future<void> setUpDependencies()" not in content:
        # Append before the last runapp or at the end
        content += setup_func
        
    with open(main_path, "w", encoding="utf-8") as f:
        f.write(content)
    print("[+] Modified lib/main.dart to bootstrap SDK dependencies.")
