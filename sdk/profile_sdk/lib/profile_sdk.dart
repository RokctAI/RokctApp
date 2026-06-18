import 'package:get_it/get_it.dart';
library profile_sdk;

export 'src/models/data/profile_models.dart';
export 'src/profile_repository.dart';
export 'src/profile_sdk_impl.dart';
export 'src/application/core/setting/setting_notifier.dart';
export 'src/application/core/setting/setting_provider.dart';
export 'src/application/core/setting/setting_state.dart';

// Customer
export 'src/application/customer/edit_profile/edit_profile_notifier.dart';
export 'src/application/customer/edit_profile/edit_profile_provider.dart';
export 'src/application/customer/edit_profile/edit_profile_state.dart';
export 'src/application/customer/profile/profile_notifier.dart';
export 'src/application/customer/profile/profile_provider.dart';
export 'src/application/customer/profile/profile_state.dart';

// Driver
export 'src/application/driver/profile/notifier/profile_edit_notifier.dart';
export 'src/application/driver/profile/notifier/profile_image_notifier.dart';
export 'src/application/driver/profile/notifier/profile_settings_notifier.dart';
export 'src/application/driver/profile/provider/profile_edit_provider.dart';
export 'src/application/driver/profile/provider/profile_image_provider.dart';
export 'src/application/driver/profile/provider/profile_settings_provider.dart';
export 'src/application/driver/profile/state/profile_edit_state.dart';
export 'src/application/driver/profile/state/profile_image_state.dart';
export 'src/application/driver/profile/state/profile_settings_state.dart';

// Manager
export 'src/application/manager/profile/profile_notifier.dart';
export 'src/application/manager/profile/profile_provider.dart';
export 'src/application/manager/profile/profile_state.dart';




// Currency
export 'src/application/core/currency/currency_notifier.dart';
export 'src/application/core/currency/currency_provider.dart';
export 'src/application/core/currency/currency_state.dart';

// Domain Interfaces
export 'src/domain/interface/user.dart';
export 'src/domain/interface/address.dart';
export 'src/domain/interface/settings.dart';
export 'src/domain/interface/manager_users.dart';
export 'src/domain/interface/manager_settings.dart';
export 'src/domain/interface/driver_user_repository.dart';
export 'src/domain/interface/driver_settings_repository.dart';

export 'src/di/profile_di.dart';

// Global DI Getters
SettingsRepositoryFacade get settingsRepository => GetIt.instance.get<SettingsRepositoryFacade>();
UserRepositoryFacade get userRepository => GetIt.instance.get<UserRepositoryFacade>();
AddressRepositoryFacade get selectAddressRepository => GetIt.instance.get<AddressRepositoryFacade>();
driver_settings_int.DriverSettingsRepository get driverSettingsRepository => GetIt.instance.get<driver_settings_int.DriverSettingsRepository>();
driver_user_int.DriverUserRepository get driverUserRepository => GetIt.instance.get<driver_user_int.DriverUserRepository>();
UsersInterface get managerUserRepository => GetIt.instance.get<UsersInterface>();
SettingsInterface get managerSettingsRepository => GetIt.instance.get<SettingsInterface>();
