import 'package:get_it/get_it.dart';
import '../../profile_sdk.dart';
import '../profile_repository.dart';
import 'package:rokctapp/customer/repository/address_repository.dart';
import 'package:rokctapp/driver/infrastructure/repositories/user_repository.dart';
import 'package:rokctapp/driver/infrastructure/repositories/settings_repository.dart';
import 'package:rokctapp/manager/infrastructure/repositories/users_repository.dart';
import 'package:rokctapp/manager/infrastructure/repositories/settings_repository.dart';
import 'package:rokctapp/customer/repository/settings_repository.dart' as customer_settings_repo;

class ProfileSdkDependencies {
  static void register(GetIt getIt) {
    getIt.registerSingleton<SettingsRepositoryFacade>(customer_settings_repo.SettingsRepository());
    getIt.registerSingleton<AddressRepositoryFacade>(AddressRepository());
    getIt.registerSingleton<UserRepositoryFacade>(UserRepository());
    getIt.registerSingleton<driver_user_int.DriverUserRepository>(UserRepositoryImpl());
    getIt.registerSingleton<driver_settings_int.DriverSettingsRepository>(SettingsRepositoryImpl());
    getIt.registerSingleton<UsersInterface>(UsersRepository());
    getIt.registerSingleton<SettingsInterface>(SettingsRepository());
  }
}
