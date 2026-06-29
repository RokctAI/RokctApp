import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orders_sdk/orders_sdk.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:core_sdk/core_sdk.dart';

final orderDetailsProvider =
    StateNotifierProvider<
      OrderDetailsNotifier<OrderData>,
      OrderDetailsState<OrderData>
    >((ref) => OrderDetailsNotifier<OrderData>(managerOrdersRepository));

