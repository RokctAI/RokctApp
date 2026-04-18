import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/order/shipping/address/order/order_address_state.dart';
import 'package:rokctapp/manager/infrastructure/models/models.dart';

class OrderAddressNotifier extends AutoDisposeNotifier<OrderAddressState> {
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
