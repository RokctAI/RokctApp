import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/core/domain/di/dependency_manager.dart';
import 'package:rokctapp/manager/application/foods/create/stocks/addons/create_food_addons_notifier.dart';
import 'package:rokctapp/manager/application/foods/create/stocks/addons/create_food_addons_state.dart';

final createFoodAddonsProvider =
    StateNotifierProvider<CreateFoodAddonsNotifier, CreateFoodAddonsState>(
      (ref) => CreateFoodAddonsNotifier(managerProductRepository),
    );
