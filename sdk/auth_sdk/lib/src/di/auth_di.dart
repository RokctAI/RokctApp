import 'package:get_it/get_it.dart';
import '../../auth_sdk.dart';
import '../auth_repository.dart';
import 'package:rokctapp/driver/infrastructure/repositories/auth_repository.dart';
import 'package:rokctapp/manager/infrastructure/repositories/auth_repository.dart';

class AuthSdkDependencies {
  static void register(GetIt getIt) {
    getIt.registerSingleton<AuthRepositoryFacade>(AuthRepository());
    getIt.registerSingleton<AuthInterface>(manager_auth_impl.AuthRepository());
    getIt.registerSingleton<driver_auth_int.AuthRepository>(AuthRepositoryImpl());
  }
}
