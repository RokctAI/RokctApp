import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/order/shipping/delivery/delivery_type_state.dart';
import 'package:rokctapp/manager/application/order/shipping/delivery/delivery_type_notifier.dart';

final deliveryTypeProvider =
    StateNotifierProvider<DeliveryTypeNotifier, DeliveryTypeState>(
      (ref) => DeliveryTypeNotifier(),
    );
