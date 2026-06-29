import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:orders_sdk/src/application/manager/order_products/order_products_state.dart';
import 'package:orders_sdk/src/application/manager/order_products/order_products_notifier.dart';
import 'package:core_sdk/core_sdk.dart';

final orderProductsProvider =
    StateNotifierProvider<OrderProductsNotifier, OrderProductsState>(
      (ref) => OrderProductsNotifier(managerProductRepository),
    );
