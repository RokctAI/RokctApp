import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:orders_sdk/src/application/manager/order/shipping/address/order/order_address_state.dart';
import 'package:orders_sdk/src/application/manager/order/shipping/address/order/order_address_notifier.dart';

final orderAddressProvider =
    StateNotifierProvider<OrderAddressNotifier, OrderAddressState>(
      (ref) => OrderAddressNotifier(),
    );
