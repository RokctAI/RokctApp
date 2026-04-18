import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/core/domain/di/dependency_manager.dart';
import 'package:rokctapp/driver/application/order/all_order/order_notifier.dart';
import 'package:rokctapp/driver/application/order/all_order/order_state.dart';

final orderProvider = StateNotifierProvider<OrderNotifier, OrderState>(
  (ref) => OrderNotifier(OrdersRepositoryFacade),
);
