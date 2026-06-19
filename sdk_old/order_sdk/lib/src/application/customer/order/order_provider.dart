import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/customer/application/order/order_notifier.dart';
import 'package:rokctapp/customer/application/order/order_state.dart';

final orderProvider = NotifierProvider<OrderNotifier, OrderState>(
  () => OrderNotifier(),
);
