import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:orders_sdk/src/application/manager/order/order_state.dart';
import 'package:orders_sdk/src/application/manager/order/order_notifier.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

final orderProvider = StateNotifierProvider<OrderNotifier, OrderState>(
  (ref) => OrderNotifier(managerOrdersRepository),
);
