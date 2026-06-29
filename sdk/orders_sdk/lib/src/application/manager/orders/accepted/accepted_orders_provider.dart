import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:orders_sdk/src/application/manager/orders/accepted/accepted_orders_state.dart';
import 'package:orders_sdk/src/application/manager/orders/accepted/accepted_orders_notifier.dart';
import 'package:core_sdk/core_sdk.dart';

final acceptedOrdersProvider =
    StateNotifierProvider<AcceptedOrdersNotifier, AcceptedOrdersState>(
      (ref) => AcceptedOrdersNotifier(managerOrdersRepository),
    );
