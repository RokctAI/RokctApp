import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:orders_sdk/src/application/customer/orders_list/orders_list_notifier.dart';
import 'package:orders_sdk/src/application/customer/orders_list/orders_list_state.dart';

final ordersListProvider =
    NotifierProvider<OrdersListNotifier, OrdersListState>(
      () => OrdersListNotifier(),
    );
