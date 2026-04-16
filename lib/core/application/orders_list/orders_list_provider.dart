import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/core/application/orders_list/orders_list_notifier.dart';
import 'package:rokctapp/core/application/orders_list/orders_list_state.dart';

final ordersListProvider =
    NotifierProvider<OrdersListNotifier, OrdersListState>(
      () => OrdersListNotifier(),
    );
