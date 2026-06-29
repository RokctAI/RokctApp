import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:orders_sdk/src/application/manager/order/order_state.dart';
import 'package:orders_sdk/src/application/manager/order/order_notifier.dart';
import 'package:core_sdk/core_sdk.dart';

final orderProvider = StateNotifierProvider<OrderNotifier, OrderState>(
  (ref) => OrderNotifier(managerOrdersRepository),
);
