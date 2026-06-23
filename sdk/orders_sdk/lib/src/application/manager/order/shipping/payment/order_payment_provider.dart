import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:orders_sdk/src/application/manager/order/shipping/payment/order_payment_state.dart';
import 'package:orders_sdk/src/application/manager/order/shipping/payment/order_payment_notifier.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

final orderPaymentProvider =
    StateNotifierProvider<OrderPaymentNotifier, OrderPaymentState>(
      (ref) => OrderPaymentNotifier(managerOrdersRepository),
    );
