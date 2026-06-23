import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:products_sdk/src/application/manager/foods/create/details/kitchens/create_food_kitchens_state.dart';
import 'package:products_sdk/src/application/manager/foods/create/details/kitchens/create_food_kitchens_notifier.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

final createFoodKitchensProvider =
    StateNotifierProvider<CreateFoodKitchensNotifier, CreateFoodKitchensState>(
      (ref) => CreateFoodKitchensNotifier(managerCatalogRepository),
    );
