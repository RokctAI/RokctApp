import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:products_sdk/src/application/manager/foods/edit/details/kitchen/edit_food_kitchens_state.dart';
import 'package:products_sdk/src/application/manager/foods/edit/details/kitchen/edit_food_kitchens_notifier.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

final editFoodKitchensProvider =
    StateNotifierProvider<EditFoodKitchensNotifier, EditFoodKitchensState>(
      (ref) => EditFoodKitchensNotifier(managerCatalogRepository),
    );
