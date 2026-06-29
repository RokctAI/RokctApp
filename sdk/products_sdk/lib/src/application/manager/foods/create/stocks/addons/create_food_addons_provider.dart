import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:core_sdk/core_sdk.dart';
import 'package:products_sdk/src/application/manager/foods/create/stocks/addons/create_food_addons_notifier.dart';
import 'package:products_sdk/src/application/manager/foods/create/stocks/addons/create_food_addons_state.dart';

final createFoodAddonsProvider =
    StateNotifierProvider<CreateFoodAddonsNotifier, CreateFoodAddonsState>(
      (ref) => CreateFoodAddonsNotifier(managerProductRepository),
    );
