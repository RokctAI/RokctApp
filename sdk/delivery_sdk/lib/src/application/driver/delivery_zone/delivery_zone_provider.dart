import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:merchants_sdk/src/application/driver/delivery_zone/delivery_zone_state.dart';
import 'package:merchants_sdk/src/application/driver/delivery_zone/delivery_zone_notifier.dart';
import 'package:core_sdk/core_sdk.dart';

final deliveryZoneProvider =
    StateNotifierProvider<DeliveryZoneNotifier, DeliveryZoneState>(
      (ref) => DeliveryZoneNotifier(driverUserRepository),
    );
