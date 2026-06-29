import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:products_sdk/src/application/manager/foods/edit/details/units/edit_food_units_state.dart';
import 'package:products_sdk/src/application/manager/foods/edit/details/units/edit_food_units_notifier.dart';
import 'package:core_sdk/core_sdk.dart';

final editFoodUnitsProvider =
    StateNotifierProvider<EditFoodUnitsNotifier, EditFoodUnitsState>(
      (ref) => EditFoodUnitsNotifier(managerCatalogRepository),
    );
