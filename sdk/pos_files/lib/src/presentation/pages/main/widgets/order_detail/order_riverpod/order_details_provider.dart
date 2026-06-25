import 'package:admin_desktop/src/core/di/dependency_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orders_sdk/orders_sdk.dart';
import 'package:admin_desktop/src/models/data/order_data.dart';

final orderDetailsProvider =
    StateNotifierProvider<
      OrderDetailsNotifier<OrderData>,
      OrderDetailsState<OrderData>
    >(
      (ref) =>
          OrderDetailsNotifier<OrderData>(ordersRepository, usersRepository),
    );
