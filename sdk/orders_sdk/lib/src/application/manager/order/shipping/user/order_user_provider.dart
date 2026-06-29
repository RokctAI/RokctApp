import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:orders_sdk/src/application/manager/order/shipping/user/order_user_state.dart';
import 'package:orders_sdk/src/application/manager/order/shipping/user/order_user_notifier.dart';
import 'package:core_sdk/core_sdk.dart';

final orderUserProvider =
    StateNotifierProvider<OrderUserNotifier, OrderUserState>(
      (ref) => OrderUserNotifier(managerUsersRepository),
    );
