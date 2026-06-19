import 'package:get_it/get_it.dart';
import '../domain/interface/kitchen.dart';
import '../data/kitchen_repository_impl.dart';

class KitchenSdkDependencies {
  static void register(GetIt getIt) {
    getIt.registerSingleton<KitchenRepositoryFacade>(KitchenRepositoryImpl());
  }
}
