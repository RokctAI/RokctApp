import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:orders_sdk/src/application/manager/orders/on_a_way/on_a_way_orders_state.dart';
import 'package:orders_sdk/src/application/manager/orders/on_a_way/on_a_way_orders_notifier.dart';
import 'package:core_sdk/core_sdk.dart';

final onAWayOrdersProvider =
    StateNotifierProvider<OnAWayOrdersNotifier, OnAWayOrdersState>(
      (ref) => OnAWayOrdersNotifier(managerOrdersRepository),
    );
