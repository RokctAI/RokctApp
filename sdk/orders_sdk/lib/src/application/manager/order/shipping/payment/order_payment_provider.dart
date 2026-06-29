import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:orders_sdk/src/application/manager/order/shipping/payment/order_payment_state.dart';
import 'package:orders_sdk/src/application/manager/order/shipping/payment/order_payment_notifier.dart';
import 'package:core_sdk/core_sdk.dart';

final orderPaymentProvider =
    StateNotifierProvider<OrderPaymentNotifier, OrderPaymentState>(
      (ref) => OrderPaymentNotifier(managerOrdersRepository),
    );
