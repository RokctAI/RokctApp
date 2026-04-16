import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/core/application/order/order_notifier.dart';
import 'package:rokctapp/core/application/order/order_state.dart';

final orderProvider = NotifierProvider.autoDispose<OrderNotifier, OrderState>(
  () => OrderNotifier(),
);
