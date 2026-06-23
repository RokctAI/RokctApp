import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:orders_sdk/src/application/manager/order_cart/order_cart_state.dart';
import 'package:orders_sdk/src/application/manager/order_cart/order_cart_notifier.dart';

final orderCartProvider =
    StateNotifierProvider<OrderCartNotifier, OrderCartState>(
      (ref) => OrderCartNotifier(),
    );
