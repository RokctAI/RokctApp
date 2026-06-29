import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:products_sdk/src/application/manager/foods/create/details/create_food_details_state.dart';
import 'package:products_sdk/src/application/manager/foods/create/details/create_food_details_notifier.dart';
import 'package:core_sdk/core_sdk.dart';

final createFoodDetailsProvider =
    StateNotifierProvider<CreateFoodDetailsNotifier, CreateFoodDetailsState>(
      (ref) => CreateFoodDetailsNotifier(
        managerProductRepository,
        managerSettingsRepository,
      ),
    );
