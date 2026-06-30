import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:delivery_sdk/delivery_sdk.dart';
import 'package:delivery_sdk/src/application/driver/driver_state.dart';

class DriverNotifier extends StateNotifier<DriverState> {
  DriverNotifier() : super(const DriverState());

  void setDriverData(DeliveryResponse? data) {
    state = state.copyWith(driverData: data);
  }
}

