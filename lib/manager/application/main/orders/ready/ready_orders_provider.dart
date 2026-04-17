import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/main/orders/ready/ready_orders_state.dart';
import 'package:rokctapp/manager/application/main/orders/ready/ready_orders_notifier.dart';
import 'package:rokctapp/domain/di/dependency_manager.dart';

final readyOrdersProvider =
    StateNotifierProvider<ReadyOrdersNotifier, ReadyOrdersState>(
      (ref) => ReadyOrdersNotifier(ordersRepository),
    );
