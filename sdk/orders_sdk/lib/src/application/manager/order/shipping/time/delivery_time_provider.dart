import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:orders_sdk/src/application/manager/order/shipping/time/delivery_time_state.dart';
import 'package:orders_sdk/src/application/manager/order/shipping/time/delivery_time_notifier.dart';

final deliveryTimeProvider =
    StateNotifierProvider<DeliveryTimeNotifier, DeliveryTimeState>(
      (ref) => DeliveryTimeNotifier(),
    );
