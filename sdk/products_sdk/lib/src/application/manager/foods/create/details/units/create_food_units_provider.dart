import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:products_sdk/src/application/manager/foods/create/details/units/create_food_units_state.dart';
import 'package:products_sdk/src/application/manager/foods/create/details/units/create_food_units_notifier.dart';
import 'package:core_sdk/core_sdk.dart';

final createFoodUnitsProvider =
    StateNotifierProvider<CreateFoodUnitsNotifier, CreateFoodUnitsState>(
      (ref) => CreateFoodUnitsNotifier(managerCatalogRepository),
    );
