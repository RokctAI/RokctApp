import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/foods/create/details/units/create_food_units_state.dart';
import 'package:rokctapp/manager/application/foods/create/details/units/create_food_units_notifier.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

final createFoodUnitsProvider =
    StateNotifierProvider<CreateFoodUnitsNotifier, CreateFoodUnitsState>(
      (ref) => CreateFoodUnitsNotifier(managerCatalogRepository),
    );
