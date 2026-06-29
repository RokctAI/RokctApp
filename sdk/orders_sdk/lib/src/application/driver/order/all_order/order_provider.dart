import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orders_sdk/orders_sdk.dart';
import 'package:rokctapp/driver/infrastructure/models/data/order_detail.dart';
import 'package:core_sdk/core_sdk.dart';

final orderProvider =
    StateNotifierProvider<
      OrderNotifier<OrderDetailData>,
      OrderState<OrderDetailData>
    >((ref) => OrderNotifier<OrderDetailData>(driverOrdersRepository));
