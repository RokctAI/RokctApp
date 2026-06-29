import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:orders_sdk/src/application/manager/order/create_order_state.dart';
import 'package:orders_sdk/src/application/manager/order/create_order_notifier.dart';
import 'package:core_sdk/core_sdk.dart';

final createOrderProvider =
    StateNotifierProvider<CreateOrderNotifier, CreateOrderState>(
      (ref) => CreateOrderNotifier(managerOrdersRepository),
    );
