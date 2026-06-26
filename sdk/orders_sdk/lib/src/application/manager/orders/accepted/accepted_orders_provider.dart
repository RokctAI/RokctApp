import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:orders_sdk/src/application/manager/orders/accepted/accepted_orders_state.dart';
import 'package:orders_sdk/src/application/manager/orders/accepted/accepted_orders_notifier.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

final acceptedOrdersProvider =
    StateNotifierProvider<AcceptedOrdersNotifier, AcceptedOrdersState>(
      (ref) => AcceptedOrdersNotifier(managerOrdersRepository),
    );
