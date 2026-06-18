import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/main/orders/new/new_orders_state.dart';
import 'package:rokctapp/manager/application/main/orders/new/new_orders_notifier.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

final newOrdersProvider =
    StateNotifierProvider<NewOrdersNotifier, NewOrdersState>(
      (ref) => NewOrdersNotifier(managerOrdersRepository),
    );
