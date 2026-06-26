import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:users_sdk/src/domain/interface/user_repository_facade.dart';
import 'package:users_sdk/src/infrastructure/repositories/user_repository.dart';

class UsersSdkDependencies {
  static void register(GetIt getIt) {
    getIt.registerLazySingleton<UserRepositoryFacade>(
      () => UserRepository(
        getIt<Dio>(),
      ),
    );
  }
}
