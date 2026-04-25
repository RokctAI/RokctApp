import 'package:get_it/get_it.dart';
import 'package:google_place/google_place.dart';
import 'package:rokctapp/core/presentation/routes/app_router.dart';

// Core Interfaces
import 'package:rokctapp/core/domain/interface/address.dart';
import 'package:rokctapp/core/domain/interface/auth.dart';
import 'package:rokctapp/core/domain/interface/banners.dart';
import 'package:rokctapp/core/domain/interface/blogs.dart';
import 'package:rokctapp/core/domain/interface/brands.dart';
import 'package:rokctapp/core/domain/interface/cart.dart';
import 'package:rokctapp/core/domain/interface/categories.dart';
import 'package:rokctapp/core/domain/interface/currencies.dart';
import 'package:rokctapp/core/domain/interface/draw.dart';
import 'package:rokctapp/core/domain/interface/gallery.dart';
import 'package:rokctapp/core/domain/interface/notification.dart';
import 'package:rokctapp/core/domain/interface/orders.dart';
import 'package:rokctapp/core/domain/interface/parcel.dart';
import 'package:rokctapp/core/domain/interface/payments.dart';
import 'package:rokctapp/core/domain/interface/products.dart';
import 'package:rokctapp/core/domain/interface/settings.dart';
import 'package:rokctapp/core/domain/interface/shops.dart';
import 'package:rokctapp/core/domain/interface/user.dart';

// Customer Implementations
import 'package:rokctapp/customer/repository/address_repository.dart';
import 'package:rokctapp/customer/repository/auth_repository.dart';
import 'package:rokctapp/customer/repository/banners_repository.dart';
import 'package:rokctapp/customer/repository/blogs_repository.dart';
import 'package:rokctapp/customer/repository/brands_repository.dart';
import 'package:rokctapp/customer/repository/cart_repository.dart';
import 'package:rokctapp/customer/repository/categories_repository.dart';
import 'package:rokctapp/customer/repository/currencies_repository.dart';
import 'package:rokctapp/customer/repository/draw_repository.dart'
    as customer_draw_repo;
import 'package:rokctapp/customer/repository/gallery_repository.dart';
import 'package:rokctapp/customer/repository/notification_repository.dart'
    as customer_notif_repo;
import 'package:rokctapp/customer/repository/orders_repository.dart'
    as customer_orders_repo;
import 'package:rokctapp/customer/repository/parcel_repository.dart'
    as customer_parcel_repo;
import 'package:rokctapp/customer/repository/payments_repository.dart';
import 'package:rokctapp/customer/repository/products_repository.dart';
import 'package:rokctapp/customer/repository/settings_repository.dart'
    as customer_settings_repo;
import 'package:rokctapp/customer/repository/shops_repository.dart';
import 'package:rokctapp/customer/repository/user_repository.dart'
    as customer_user_repo;

import 'package:rokctapp/core/infrastructure/constants/constants.dart';
import 'package:rokctapp/core/infrastructure/utils/services.dart';
import 'package:rokctapp/core/domain/handlers/handlers.dart';

// Driver Interfaces
import 'package:rokctapp/driver/domain/interface/notification.dart'
    as driver_notif_int;
import 'package:rokctapp/driver/domain/interface/parcel.dart'
    as driver_parcel_int;
import 'package:rokctapp/driver/domain/interface/orders.dart'
    as driver_orders_int;
import 'package:rokctapp/driver/domain/interface/settings_repository.dart'
    as driver_settings_int;
import 'package:rokctapp/driver/domain/interface/draw_repository.dart'
    as driver_draw_int;
import 'package:rokctapp/driver/domain/interface/user_repository.dart'
    as driver_user_int;
import 'package:rokctapp/driver/domain/interface/auth_repository.dart'
    as driver_auth_int;

// Driver Implementations
import 'package:rokctapp/driver/infrastructure/repositories/notification_repository.dart'
    as driver_notif_impl;
import 'package:rokctapp/driver/infrastructure/repositories/parcel_repository.dart'
    as driver_parcel_impl;
import 'package:rokctapp/driver/infrastructure/repositories/orders_repository.dart'
    as driver_orders_impl;
import 'package:rokctapp/driver/infrastructure/repositories/settings_repository_impl.dart'
    as driver_settings_impl;
import 'package:rokctapp/driver/infrastructure/repositories/draw_repository_impl.dart'
    as driver_draw_impl;
import 'package:rokctapp/driver/infrastructure/repositories/user_repository_impl.dart'
    as driver_user_impl;
import 'package:rokctapp/driver/infrastructure/repositories/auth_repository_impl.dart'
    as driver_auth_impl;

// Manager Interfaces
import 'package:rokctapp/manager/domain/interface/notification.dart'
    as manager_notif_int;
import 'package:rokctapp/manager/domain/interface/payment_facade.dart'
    as manager_payment_int;
import 'package:rokctapp/manager/domain/interface/subscription_facade.dart'
    as manager_sub_int;
import 'package:rokctapp/manager/domain/interface/table.dart'
    as manager_table_int;
import 'package:rokctapp/manager/domain/interface/auth.dart'
    as manager_auth_int;
import 'package:rokctapp/manager/domain/interface/users.dart'
    as manager_users_int;
import 'package:rokctapp/manager/domain/interface/shops.dart'
    as manager_shops_int;
import 'package:rokctapp/manager/domain/interface/orders.dart'
    as manager_orders_int;
import 'package:rokctapp/manager/domain/interface/catalog.dart'
    as manager_catalog_int;
import 'package:rokctapp/manager/domain/interface/settings.dart'
    as manager_settings_int;
import 'package:rokctapp/manager/domain/interface/products.dart'
    as manager_products_int;

// Manager Implementations
import 'package:rokctapp/manager/infrastructure/repositories/payment_repository.dart'
    as manager_payment_impl;
import 'package:rokctapp/manager/infrastructure/repositories/subscription_repository.dart'
    as manager_sub_impl;
import 'package:rokctapp/manager/infrastructure/repositories/auth_repository.dart'
    as manager_auth_impl;
import 'package:rokctapp/manager/infrastructure/repositories/table_repository.dart'
    as manager_table_impl;
import 'package:rokctapp/manager/infrastructure/repositories/users_repository.dart'
    as manager_users_impl;
import 'package:rokctapp/manager/infrastructure/repositories/shops_repository.dart'
    as manager_shops_impl;
import 'package:rokctapp/manager/infrastructure/repositories/orders_repository.dart'
    as manager_orders_impl;
import 'package:rokctapp/manager/infrastructure/repositories/catalog_repository.dart'
    as manager_catalog_impl;
import 'package:rokctapp/manager/infrastructure/repositories/settings_repository.dart'
    as manager_settings_impl;
import 'package:rokctapp/manager/infrastructure/repositories/products_repository.dart'
    as manager_products_impl;
import 'package:rokctapp/manager/infrastructure/repositories/notification_repository.dart'
    as manager_notif_impl;

final GetIt getIt = GetIt.instance;

Future<void> setUpDependencies() async {
  if (getIt.isRegistered<HttpService>()) return;

  // Common
  getIt.registerSingleton<AppRouter>(AppRouter());
  getIt.registerLazySingleton<HttpService>(() => HttpService());
  getIt.registerSingleton<GooglePlace>(GooglePlace(AppConstants.googleApiKey));
  getIt.registerSingleton<Map>(LocalStorage.getTranslations());

  // Core & Customer
  getIt.registerSingleton<SettingsRepositoryFacade>(
    customer_settings_repo.SettingsRepository(),
  );
  getIt.registerSingleton<AuthRepositoryFacade>(AuthRepository());
  getIt.registerSingleton<ProductsRepositoryFacade>(ProductsRepository());
  getIt.registerSingleton<ShopsRepositoryFacade>(ShopsRepository());
  getIt.registerSingleton<BrandsRepositoryFacade>(BrandsRepository());
  getIt.registerSingleton<GalleryRepositoryFacade>(GalleryRepository());
  getIt.registerSingleton<CategoriesRepositoryFacade>(CategoriesRepository());
  getIt.registerSingleton<CurrenciesRepositoryFacade>(CurrenciesRepository());
  getIt.registerSingleton<AddressRepositoryFacade>(AddressRepository());
  getIt.registerSingleton<BannersRepositoryFacade>(BannersRepository());
  getIt.registerSingleton<PaymentsRepositoryFacade>(PaymentsRepository());
  getIt.registerSingleton<OrdersInterface>(
    customer_orders_repo.OrdersRepository(),
  );
  getIt.registerSingleton<UserRepositoryFacade>(
    customer_user_repo.UserRepository(),
  );
  getIt.registerSingleton<BlogsRepositoryFacade>(BlogsRepository());
  getIt.registerSingleton<CartRepositoryFacade>(CartRepository());
  getIt.registerSingleton<DrawRepositoryFacade>(
    customer_draw_repo.DrawRepository(),
  );
  getIt.registerSingleton<ParcelRepositoryFacade>(
    customer_parcel_repo.ParcelRepository(),
  );
  getIt.registerSingleton<NotificationRepositoryFacade>(
    customer_notif_repo.NotificationRepository(),
  );

  // Driver
  getIt.registerSingleton<driver_settings_int.DriverSettingsRepository>(
    driver_settings_impl.SettingsRepositoryImpl(),
  );
  getIt.registerSingleton<driver_auth_int.AuthRepository>(
    driver_auth_impl.AuthRepositoryImpl(),
  );
  getIt.registerSingleton<driver_user_int.DriverUserRepository>(
    driver_user_impl.UserRepositoryImpl(),
  );
  getIt.registerSingleton<driver_draw_int.DriverDrawRepository>(
    driver_draw_impl.DrawRepositoryImpl(),
  );
  getIt.registerSingleton<driver_orders_int.DriverOrdersRepository>(
    driver_orders_impl.OrdersRepository(),
  );
  getIt.registerSingleton<driver_parcel_int.DriverParcelRepository>(
    driver_parcel_impl.ParcelRepository(),
  );
  getIt.registerSingleton<driver_notif_int.DriverNotificationRepository>(
    driver_notif_impl.NotificationRepositoryImpl(),
  );

  // Manager
  getIt.registerSingleton<manager_auth_int.AuthInterface>(
    manager_auth_impl.AuthRepository(),
  );
  getIt.registerSingleton<manager_table_int.TableInterface>(
    manager_table_impl.TableRepository(),
  );
  getIt.registerSingleton<manager_users_int.UsersInterface>(
    manager_users_impl.UsersRepository(),
  );
  getIt.registerSingleton<manager_shops_int.ShopsInterface>(
    manager_shops_impl.ShopsRepository(),
  );
  getIt.registerSingleton<manager_orders_int.OrdersInterface>(
    manager_orders_impl.OrdersRepository(),
  );
  getIt.registerSingleton<manager_catalog_int.CatalogInterface>(
    manager_catalog_impl.CatalogRepository(),
  );
  getIt.registerSingleton<manager_settings_int.SettingsInterface>(
    manager_settings_impl.SettingsRepository(),
  );
  getIt.registerSingleton<manager_products_int.ProductsInterface>(
    manager_products_impl.ProductsRepository(),
  );
  getIt.registerSingleton<manager_notif_int.NotificationInterface>(
    manager_notif_impl.NotificationRepository(),
  );
  getIt.registerSingleton<manager_payment_int.PaymentsFacade>(
    manager_payment_impl.PaymentRepository(),
  );
  getIt.registerSingleton<manager_sub_int.SubscriptionsFacade>(
    manager_sub_impl.SubscriptionsRepository(),
  );
}

// Global variable accessors

// Core
final dioHttp = getIt.get<HttpService>();
final notificationRepo = getIt.get<NotificationRepositoryFacade>();
final drawRepository = getIt.get<DrawRepositoryFacade>();
final settingsRepository = getIt.get<SettingsRepositoryFacade>();
final authRepository = getIt.get<AuthRepositoryFacade>();
final productsRepository = getIt.get<ProductsRepositoryFacade>();
final shopsRepository = getIt.get<ShopsRepositoryFacade>();
final brandsRepository = getIt.get<BrandsRepositoryFacade>();
final galleryRepository = getIt.get<GalleryRepositoryFacade>();
final categoriesRepository = getIt.get<CategoriesRepositoryFacade>();
final currenciesRepository = getIt.get<CurrenciesRepositoryFacade>();
final addressesRepository = getIt.get<AddressRepositoryFacade>();
final bannersRepository = getIt.get<BannersRepositoryFacade>();
final googlePlace = getIt.get<GooglePlace>();
final paymentsRepository = getIt.get<PaymentsRepositoryFacade>();
final ordersRepository = getIt.get<OrdersInterface>();
final userRepository = getIt.get<UserRepositoryFacade>();
final blogsRepository = getIt.get<BlogsRepositoryFacade>();
final cartRepository = getIt.get<CartRepositoryFacade>();
final parcelRepository = getIt.get<ParcelRepositoryFacade>();
final translation = getIt.get<Map>();
final appRouter = getIt.get<AppRouter>();

// Driver
driver_settings_int.DriverSettingsRepository get driverSettingsRepository =>
    getIt.get<driver_settings_int.DriverSettingsRepository>();
driver_auth_int.AuthRepository get driverAuthRepository =>
    getIt.get<driver_auth_int.AuthRepository>();
driver_user_int.DriverUserRepository get driverUserRepository =>
    getIt.get<driver_user_int.DriverUserRepository>();
driver_draw_int.DriverDrawRepository get driverDrawRepository =>
    getIt.get<driver_draw_int.DriverDrawRepository>();
driver_orders_int.DriverOrdersRepository get driverOrdersRepository =>
    getIt.get<driver_orders_int.DriverOrdersRepository>();
driver_parcel_int.DriverParcelRepository get driverParcelRepository =>
    getIt.get<driver_parcel_int.DriverParcelRepository>();
driver_notif_int.DriverNotificationRepository get driverNotificationRepo =>
    getIt.get<driver_notif_int.DriverNotificationRepository>();

// Manager
manager_auth_int.AuthInterface get managerAuthRepository =>
    getIt.get<manager_auth_int.AuthInterface>();
manager_shops_int.ShopsInterface get managerShopsRepository =>
    getIt.get<manager_shops_int.ShopsInterface>();
manager_table_int.TableInterface get managerTableRepository =>
    getIt.get<manager_table_int.TableInterface>();
manager_users_int.UsersInterface get managerUsersRepository =>
    getIt.get<manager_users_int.UsersInterface>();
manager_orders_int.OrdersInterface get managerOrdersRepository =>
    getIt.get<manager_orders_int.OrdersInterface>();
manager_catalog_int.CatalogInterface get managerCatalogRepository =>
    getIt.get<manager_catalog_int.CatalogInterface>();
manager_products_int.ProductsInterface get managerProductRepository =>
    getIt.get<manager_products_int.ProductsInterface>();
manager_settings_int.SettingsInterface get managerSettingsRepository =>
    getIt.get<manager_settings_int.SettingsInterface>();
manager_notif_int.NotificationInterface get managerNotificationRepository =>
    getIt.get<manager_notif_int.NotificationInterface>();
manager_sub_int.SubscriptionsFacade get managerSubscriptionRepository =>
    getIt.get<manager_sub_int.SubscriptionsFacade>();
manager_payment_int.PaymentsFacade get managerPaymentRepositoryNew =>
    getIt.get<manager_payment_int.PaymentsFacade>();
