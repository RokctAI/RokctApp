import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:orders_sdk/src/application/manager/order/shipping/address/order/order_address_state.dart';
import 'package:core_sdk/core_sdk.dart';

class OrderAddressNotifier extends StateNotifier<OrderAddressState> {
  OrderAddressNotifier()
    : super(OrderAddressState(textController: TextEditingController()));

  void setHouse(String value) {
    state = state.copyWith(house: value.trim());
  }

  void setFloor(String value) {
    state = state.copyWith(floor: value.trim());
  }

  void setEntrance(String value) {
    state = state.copyWith(entrance: value.trim());
  }

  void setLocation({LocationData? location, required String title}) {
    state.textController?.text = title;
    state = state.copyWith(location: location);
  }
}

