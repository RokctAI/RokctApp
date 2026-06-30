import 'package:get_it/get_it.dart';
import 'package:launch_sdk/src/domain/interface/launch_service.dart';
import 'package:launch_sdk/src/infrastructure/repositories/launch_repository.dart';

class LaunchSdkDependencies {
  static void register(GetIt getIt) {
    getIt.registerLazySingleton<ILaunchService>(() => LaunchRepository());
  }
}
