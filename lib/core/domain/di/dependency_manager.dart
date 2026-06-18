import 'package:get_it/get_it.dart';
import 'package:google_place/google_place.dart';
import 'package:rokctapp/core/presentation/routes/app_router.dart';
import 'package:core_sdk/core_sdk.dart';

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
