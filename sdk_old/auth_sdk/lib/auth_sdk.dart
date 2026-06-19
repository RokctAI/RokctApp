import 'package:get_it/get_it.dart';
library auth_sdk;

export 'src/models/data/user_role.dart';
export 'src/models/data/user_model.dart';
export 'src/auth_repository.dart';
export 'src/auth_sdk_impl.dart';
export 'src/firebase_service.dart';

export 'src/models/data/user.dart';
export 'src/models/data/user_data.dart';
export 'src/application/auth.dart';
export 'src/application/login/login_state.dart';
export 'src/application/login/login_provider.dart';
export 'src/application/register/register_state.dart';
export 'src/application/register/register_provider.dart';
export 'src/application/reset_password/reset_password_state.dart';
export 'src/application/reset_password/reset_password_provider.dart';
export 'src/application/confirmation/register_confirmation_state.dart';
export 'src/application/confirmation/register_confirmation_provider.dart';




// Domain Interfaces
export 'src/domain/interface/auth.dart';
export 'src/domain/interface/manager_auth.dart';
export 'src/domain/interface/driver_auth_repository.dart';

export 'src/di/auth_di.dart';

// Global DI Getters
AuthRepositoryFacade get authRepository => GetIt.instance.get<AuthRepositoryFacade>();
driver_auth_int.AuthRepository get driverAuthRepository => GetIt.instance.get<driver_auth_int.AuthRepository>();
AuthInterface get managerAuthRepository => GetIt.instance.get<AuthInterface>();
