import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:orders_sdk/src/application/manager/order/shipping/delivery/delivery_type_state.dart';
import 'package:orders_sdk/src/application/manager/order/shipping/delivery/delivery_type_notifier.dart';

final deliveryTypeProvider =
    StateNotifierProvider<DeliveryTypeNotifier, DeliveryTypeState>(
      (ref) => DeliveryTypeNotifier(),
    );
