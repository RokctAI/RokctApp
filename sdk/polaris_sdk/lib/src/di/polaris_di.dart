import 'package:get_it/get_it.dart';
import '../infrastructure/repositories/mock_polaris_repository_impl.dart';
import '../domain/interface/polaris_repository_facade.dart';

class PolarisSdkDependencies {
  static void register(GetIt getIt) {
    if (!getIt.isRegistered<PolarisRepositoryFacade>()) {
      getIt.registerLazySingleton<PolarisRepositoryFacade>(
        () => MockPolarisRepositoryImpl(),
      );
    }
  }
}
