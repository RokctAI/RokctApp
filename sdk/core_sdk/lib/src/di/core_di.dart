import 'package:get_it/get_it.dart';
import '../../core_sdk.dart';
import 'package:rokctapp/customer/repository/currencies_repository.dart';

class CoreSdkDependencies {
  static void register(GetIt getIt) {
    getIt.registerSingleton<CurrenciesRepositoryFacade>(CurrenciesRepository());
  }
}
