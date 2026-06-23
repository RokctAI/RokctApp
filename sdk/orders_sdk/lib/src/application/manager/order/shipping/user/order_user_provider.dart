import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:orders_sdk/src/application/manager/order/shipping/user/order_user_state.dart';
import 'package:orders_sdk/src/application/manager/order/shipping/user/order_user_notifier.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

final orderUserProvider =
    StateNotifierProvider<OrderUserNotifier, OrderUserState>(
      (ref) => OrderUserNotifier(managerUsersRepository),
    );
