import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/order/shipping/time/delivery_time_state.dart';
import 'package:rokctapp/manager/application/order/shipping/time/delivery_time_notifier.dart';

final deliveryTimeProvider =
    StateNotifierProvider<DeliveryTimeNotifier, DeliveryTimeState>(
      (ref) => DeliveryTimeNotifier(),
    );
