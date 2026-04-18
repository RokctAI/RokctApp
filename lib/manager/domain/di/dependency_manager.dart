import 'package:get_it/get_it.dart';
import 'package:google_place/google_place.dart';
import 'package:rokctapp/manager/domain/interface/notification.dart';
import 'package:rokctapp/manager/domain/interface/payment_facade.dart';
import 'package:rokctapp/manager/domain/interface/subscription_facade.dart';
import 'package:rokctapp/manager/domain/interface/table.dart';
import 'package:rokctapp/manager/infrastructure/repositories/payment_repository.dart';
import 'package:rokctapp/manager/infrastructure/repositories/subscription_repository.dart';
import 'package:rokctapp/manager/infrastructure/services/local_storage.dart';
import 'package:rokctapp/manager/domain/handlers/handlers.dart';
import 'package:rokctapp/manager/domain/interface/interfaces.dart';
import 'package:rokctapp/core/presentation/routes/app_router.dart';
import 'package:rokctapp/manager/infrastructure/repositories/repositories.dart';

final GetIt getIt = GetIt.instance;

Future setUpDependencies() async {
  getIt.registerSingleton<AppRouter>(AppRouter());
  getIt.registerLazySingleton<HttpService>(() => HttpService());
  getIt.registerSingleton<Map>(LocalStorage.getTranslations());
  getIt.registerSingleton<AuthInterface>(AuthRepository());
  getIt.registerSingleton<TableInterface>(TableRepository());
  getIt.registerSingleton<UsersInterface>(UsersRepository());
  getIt.registerSingleton<ShopsInterface>(ShopsRepository());
  getIt.registerSingleton<OrdersInterface>(OrdersRepository());
  getIt.registerSingleton<CatalogInterface>(CatalogRepository());
  getIt.registerSingleton<SettingsInterface>(SettingsRepository());
  getIt.registerSingleton<ProductsInterface>(ProductsRepository());
  getIt.registerSingleton<NotificationInterface>(NotificationRepository());
  getIt.registerSingleton<PaymentsFacade>(PaymentRepository());
  getIt.registerSingleton<SubscriptionsFacade>(SubscriptionsRepository());
}

final translation = getIt.get<Map>();
final dioHttp = getIt.get<HttpService>();
final appRouter = getIt.get<AppRouter>();
final googlePlace = getIt.get<GooglePlace>();
final authRepository = getIt.get<AuthInterface>();
final shopsRepository = getIt.get<ShopsInterface>();
final tableRepository = getIt.get<TableInterface>();
final usersRepository = getIt.get<UsersInterface>();
final ordersRepository = getIt.get<OrdersInterface>();
final catalogRepository = getIt.get<CatalogInterface>();
final productRepository = getIt.get<ProductsInterface>();
final settingsRepository = getIt.get<SettingsInterface>();
final notificationRepository = getIt.get<NotificationInterface>();
final subscriptionRepository = getIt.get<SubscriptionsFacade>();
final paymentRepositoryNew = getIt.get<PaymentsFacade>();
