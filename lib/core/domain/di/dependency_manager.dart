import 'package:get_it/get_it.dart';
import 'package:google_place/google_place.dart';
import 'package:rokctapp/core/presentation/routes/app_router.dart';

// Core and Customer Page Imports
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
import 'package:rokctapp/customer/repository/address_repository.dart';
import 'package:rokctapp/customer/repository/auth_repository.dart';
import 'package:rokctapp/customer/repository/banners_repository.dart';
import 'package:rokctapp/customer/repository/blogs_repository.dart';
import 'package:rokctapp/customer/repository/brands_repository.dart';
import 'package:rokctapp/customer/repository/cart_repository.dart';
import 'package:rokctapp/customer/repository/categories_repository.dart';
import 'package:rokctapp/customer/repository/currencies_repository.dart';
import 'package:rokctapp/customer/repository/draw_repository.dart';
import 'package:rokctapp/customer/repository/gallery_repository.dart';
import 'package:rokctapp/customer/repository/notification_repository.dart';
import 'package:rokctapp/customer/repository/orders_repository.dart';
import 'package:rokctapp/customer/repository/parcel_repository.dart';
import 'package:rokctapp/customer/repository/payments_repository.dart';
import 'package:rokctapp/customer/repository/products_repository.dart';
import 'package:rokctapp/customer/repository/settings_repository.dart';
import 'package:rokctapp/customer/repository/shops_repository.dart';
import 'package:rokctapp/customer/repository/user_repository.dart';
import 'package:rokctapp/core/infrastructure/constants/constants.dart';
import 'package:rokctapp/core/infrastructure/utils/services.dart';
import 'package:rokctapp/core/domain/handlers/handlers.dart';

// Driver Module Imports
import 'package:rokctapp/driver/domain/interface/notification.dart'
    as driver_notif;
import 'package:rokctapp/driver/domain/interface/parcel.dart' as driver_parcel;
import 'package:rokctapp/driver/domain/interface/orders.dart' as driver_orders;
import 'package:rokctapp/driver/domain/interface/interfaces.dart'
    as driver_interfaces;
import 'package:rokctapp/driver/infrastructure/repositories/notification_repository.dart'
    as driver_notif_impl;
import 'package:rokctapp/driver/infrastructure/repositories/parcel_repository.dart'
    as driver_parcel_impl;
import 'package:rokctapp/driver/infrastructure/repositories/orders_repository.dart'
    as driver_orders_impl;
import 'package:rokctapp/driver/infrastructure/repositories/repositories.dart'
    as driver_repos_impl;

// Manager Module Imports
import 'package:rokctapp/manager/domain/interface/notification.dart'
    as manager_notif;
import 'package:rokctapp/manager/domain/interface/payment_facade.dart'
    as manager_payment;
import 'package:rokctapp/manager/domain/interface/subscription_facade.dart'
    as manager_sub;
import 'package:rokctapp/manager/domain/interface/table.dart' as manager_table;
import 'package:rokctapp/manager/domain/interface/interfaces.dart'
    as manager_interfaces;
import 'package:rokctapp/manager/infrastructure/repositories/payment_repository.dart'
    as manager_payment_impl;
import 'package:rokctapp/manager/infrastructure/repositories/subscription_repository.dart'
    as manager_sub_impl;
import 'package:rokctapp/manager/infrastructure/repositories/repositories.dart'
    as manager_repos_impl;

final GetIt getIt = GetIt.instance;

Future<void> setUpDependencies() async {
  if (getIt.isRegistered<HttpService>()) return;

  // Common
  getIt.registerSingleton<AppRouter>(AppRouter());
  getIt.registerLazySingleton<HttpService>(() => HttpService());
  getIt.registerSingleton<GooglePlace>(GooglePlace(AppConstants.googleApiKey));
  getIt.registerSingleton<Map>(LocalStorage.getTranslations());

  // Core & Customer
  getIt.registerSingleton<SettingsRepositoryFacade>(SettingsRepository());
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
  getIt.registerSingleton<OrdersRepositoryFacade>(OrdersRepository());
  getIt.registerSingleton<UserRepositoryFacade>(UserRepository());
  getIt.registerSingleton<BlogsRepositoryFacade>(BlogsRepository());
  getIt.registerSingleton<CartRepositoryFacade>(CartRepository());
  getIt.registerSingleton<DrawRepositoryFacade>(DrawRepository());
  getIt.registerSingleton<ParcelRepositoryFacade>(ParcelRepository());
  getIt.registerSingleton<NotificationRepositoryFacade>(
    NotificationRepository(),
  );

  // Driver
  getIt.registerSingleton<driver_interfaces.SettingsRepository>(
    driver_repos_impl.SettingsRepositoryImpl(),
  );
  getIt.registerSingleton<driver_interfaces.AuthRepository>(
    driver_repos_impl.AuthRepositoryImpl(),
  );
  getIt.registerSingleton<driver_interfaces.UserRepository>(
    driver_repos_impl.UserRepositoryImpl(),
  );
  getIt.registerSingleton<driver_interfaces.DrawRepository>(
    driver_repos_impl.DrawRepositoryImpl(),
  );
  getIt.registerSingleton<driver_orders.OrdersRepositoryFacade>(
    driver_orders_impl.OrdersRepository(),
  );
  getIt.registerSingleton<driver_parcel.ParcelRepositoryFacade>(
    driver_parcel_impl.ParcelRepository(),
  );
  getIt.registerSingleton<driver_notif.NotificationRepositoryFacade>(
    driver_notif_impl.NotificationRepositoryImpl(),
  );

  // Manager
  getIt.registerSingleton<manager_interfaces.AuthInterface>(
    manager_repos_impl.AuthRepository(),
  );
  getIt.registerSingleton<manager_table.TableInterface>(
    manager_repos_impl.TableRepository(),
  );
  getIt.registerSingleton<manager_interfaces.UsersInterface>(
    manager_repos_impl.UsersRepository(),
  );
  getIt.registerSingleton<manager_interfaces.ShopsInterface>(
    manager_repos_impl.ShopsRepository(),
  );
  getIt.registerSingleton<manager_interfaces.OrdersInterface>(
    manager_repos_impl.OrdersRepository(),
  );
  getIt.registerSingleton<manager_interfaces.CatalogInterface>(
    manager_repos_impl.CatalogRepository(),
  );
  getIt.registerSingleton<manager_interfaces.SettingsInterface>(
    manager_repos_impl.SettingsRepository(),
  );
  getIt.registerSingleton<manager_interfaces.ProductsInterface>(
    manager_repos_impl.ProductsRepository(),
  );
  getIt.registerSingleton<manager_notif.NotificationInterface>(
    manager_repos_impl.NotificationRepository(),
  );
  getIt.registerSingleton<manager_payment.PaymentsFacade>(
    manager_payment_impl.PaymentRepository(),
  );
  getIt.registerSingleton<manager_sub.SubscriptionsFacade>(
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
final ordersRepository = getIt.get<OrdersRepositoryFacade>();
final userRepository = getIt.get<UserRepositoryFacade>();
final blogsRepository = getIt.get<BlogsRepositoryFacade>();
final cartRepository = getIt.get<CartRepositoryFacade>();
final parcelRepository = getIt.get<ParcelRepositoryFacade>();
final translation = getIt.get<Map>();
final appRouter = getIt.get<AppRouter>();

// Driver
driver_interfaces.SettingsRepository get driverSettingsRepository =>
    getIt.get<driver_interfaces.SettingsRepository>();
driver_interfaces.AuthRepository get driverAuthRepository =>
    getIt.get<driver_interfaces.AuthRepository>();
driver_interfaces.UserRepository get driverUserRepository =>
    getIt.get<driver_interfaces.UserRepository>();
driver_interfaces.DrawRepository get driverDrawRepository =>
    getIt.get<driver_interfaces.DrawRepository>();
driver_orders.OrdersRepositoryFacade get driverOrdersRepository =>
    getIt.get<driver_orders.OrdersRepositoryFacade>();
driver_parcel.ParcelRepositoryFacade get driverParcelRepository =>
    getIt.get<driver_parcel.ParcelRepositoryFacade>();
driver_notif.NotificationRepositoryFacade get driverNotificationRepo =>
    getIt.get<driver_notif.NotificationRepositoryFacade>();

// Manager
manager_interfaces.AuthInterface get managerAuthRepository =>
    getIt.get<manager_interfaces.AuthInterface>();
manager_interfaces.ShopsInterface get managerShopsRepository =>
    getIt.get<manager_interfaces.ShopsInterface>();
manager_table.TableInterface get managerTableRepository =>
    getIt.get<manager_table.TableInterface>();
manager_interfaces.UsersInterface get managerUsersRepository =>
    getIt.get<manager_interfaces.UsersInterface>();
manager_interfaces.OrdersInterface get managerOrdersRepository =>
    getIt.get<manager_interfaces.OrdersInterface>();
manager_interfaces.CatalogInterface get managerCatalogRepository =>
    getIt.get<manager_interfaces.CatalogInterface>();
manager_interfaces.ProductsInterface get managerProductRepository =>
    getIt.get<manager_interfaces.ProductsInterface>();
manager_interfaces.SettingsInterface get managerSettingsRepository =>
    getIt.get<manager_interfaces.SettingsInterface>();
manager_notif.NotificationInterface get managerNotificationRepository =>
    getIt.get<manager_notif.NotificationInterface>();
manager_sub.SubscriptionsFacade get managerSubscriptionRepository =>
    getIt.get<manager_sub.SubscriptionsFacade>();
manager_payment.PaymentsFacade get managerPaymentRepositoryNew =>
    getIt.get<manager_payment.PaymentsFacade>();
