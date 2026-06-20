import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:orders_sdk/orders_sdk.dart';

final orderProvider = NotifierProvider<OrderNotifier, OrderState>(
  () => OrderNotifier(),
);

