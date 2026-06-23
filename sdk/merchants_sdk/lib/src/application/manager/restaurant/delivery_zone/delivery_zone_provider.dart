import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:merchants_sdk/src/application/manager/restaurant/delivery_zone/delivery_zone_state.dart';
import 'package:merchants_sdk/src/application/manager/restaurant/delivery_zone/delivery_zone_notifier.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

final deliveryZoneProvider =
    StateNotifierProvider<DeliveryZoneNotifier, DeliveryZoneState>(
      (ref) => DeliveryZoneNotifier(managerUsersRepository),
    );
