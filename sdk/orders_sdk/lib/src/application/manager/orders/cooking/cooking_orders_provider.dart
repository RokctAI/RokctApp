import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

import 'package:orders_sdk/src/application/manager/orders/cooking/cooking_orders_notifier.dart';
import 'package:orders_sdk/src/application/manager/orders/cooking/cooking_orders_state.dart';

final cookingOrdersProvider =
    StateNotifierProvider<CookingOrdersNotifier, CookingOrdersState>(
      (ref) => CookingOrdersNotifier(managerOrdersRepository),
    );
