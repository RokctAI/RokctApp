import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/foods/edit/stocks/addons/edit_food_addons_state.dart';
import 'package:rokctapp/manager/application/foods/edit/stocks/addons/edit_food_addons_notifier.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

final editFoodAddonsProvider =
    StateNotifierProvider<EditFoodAddonsNotifier, EditFoodAddonsState>(
      (ref) => EditFoodAddonsNotifier(managerProductRepository),
    );
