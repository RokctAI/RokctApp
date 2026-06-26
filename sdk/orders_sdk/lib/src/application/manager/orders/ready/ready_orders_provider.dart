import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:orders_sdk/src/application/manager/orders/ready/ready_orders_state.dart';
import 'package:orders_sdk/src/application/manager/orders/ready/ready_orders_notifier.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

final readyOrdersProvider =
    StateNotifierProvider<ReadyOrdersNotifier, ReadyOrdersState>(
      (ref) => ReadyOrdersNotifier(managerOrdersRepository),
    );
