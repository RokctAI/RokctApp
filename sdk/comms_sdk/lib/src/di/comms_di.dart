import 'package:get_it/get_it.dart';

class CommsSdkDependencies {
  static void register(GetIt getIt) {
    getIt.registerLazySingleton<NotificationService>(() => NotificationService());
  }
}
