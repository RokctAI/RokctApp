import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:orders_sdk/src/application/manager/order/shipping/address/select_address_state.dart';
import 'package:orders_sdk/src/application/manager/order/shipping/address/select_address_notifier.dart';

final selectAddressProvider =
    StateNotifierProvider<SelectAddressNotifier, SelectAddressState>(
      (ref) => SelectAddressNotifier(),
    );
