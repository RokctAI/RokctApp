import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/order_details/order_details_state.dart';
import 'package:rokctapp/manager/application/order_details/order_details_notifier.dart';
import 'package:rokctapp/manager/domain/di/dependency_manager.dart';

final orderDetailsProvider =
    StateNotifierProvider<OrderDetailsNotifier, OrderDetailsState>(
      (ref) => OrderDetailsNotifier(ordersRepository),
    );
