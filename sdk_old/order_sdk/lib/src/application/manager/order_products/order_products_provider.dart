import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/order_products/order_products_state.dart';
import 'package:rokctapp/manager/application/order_products/order_products_notifier.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

final orderProductsProvider =
    StateNotifierProvider<OrderProductsNotifier, OrderProductsState>(
      (ref) => OrderProductsNotifier(managerProductRepository),
    );
