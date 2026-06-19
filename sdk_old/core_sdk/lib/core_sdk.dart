import 'package:get_it/get_it.dart';
library core_sdk;

export 'src/handlers/http_service.dart';
export 'src/handlers/token_interceptor.dart';
export 'src/handlers/api_result.dart';
export 'src/handlers/network_exceptions.dart';
export 'src/utils/local_storage.dart';
export 'src/utils/core_local_storage.dart';
export 'src/utils/app_database.dart';
export 'src/utils/drift_tables.dart';
export 'src/utils/app_connectivity.dart';
export 'src/utils/app_helpers.dart';
export 'src/utils/app_validators.dart';
export 'src/utils/time_service.dart';
export 'src/utils/vibration.dart';
export 'src/constants/enums.dart';
export 'src/constants/storage_keys.dart';
export 'src/constants/tr_keys.dart';
export 'src/constants/app_constants.dart';
export 'src/constants/constants.dart';

// Models
export 'src/models/settings_data.dart';

export 'src/models/language.dart';



// Language
export 'src/application/core/language/language_notifier.dart';
export 'src/application/core/language/language_provider.dart';
export 'src/application/core/language/language_state.dart';

// App
export 'src/application/core/app/app_notifier.dart';
export 'src/application/core/app/app_provider.dart';
export 'src/application/core/app/app_state.dart';

// Select
export 'src/application/core/select/select_notifier.dart';
export 'src/application/core/select/select_provider.dart';
export 'src/application/core/select/select_state.dart';

// Floating_button
export 'src/application/core/floating_button/floating_button_notifier.dart';
export 'src/application/core/floating_button/floating_button_provider.dart';
export 'src/application/core/floating_button/floating_button_state.dart';

// Main
export 'src/application/core/main/main_notifier.dart';
export 'src/application/core/main/main_provider.dart';
export 'src/application/core/main/main_state.dart';

// Domain Interfaces
export 'src/domain/interface/currencies.dart';
export 'src/domain/interface/draw.dart';
export 'src/domain/interface/driver_draw_repository.dart';

export 'src/di/core_di.dart';

// Global DI Getters
DrawRepositoryFacade get drawRepository => GetIt.instance.get<DrawRepositoryFacade>();
CurrenciesRepositoryFacade get currenciesRepository => GetIt.instance.get<CurrenciesRepositoryFacade>();
driver_draw_int.DriverDrawRepository get driverDrawRepository => GetIt.instance.get<driver_draw_int.DriverDrawRepository>();

// Splash
export 'src/application/core/splash/splash_notifier.dart';
export 'src/application/core/splash/splash_provider.dart';
export 'src/application/core/splash/splash_state.dart';
