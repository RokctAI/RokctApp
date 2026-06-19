library kitchen_sdk;

export 'src/domain/interface/kitchen.dart';
export 'src/di/kitchen_di.dart';
import 'package:get_it/get_it.dart';
import 'src/domain/interface/kitchen.dart';

KitchenRepositoryFacade get kitchenRepository => GetIt.instance.get<KitchenRepositoryFacade>();
