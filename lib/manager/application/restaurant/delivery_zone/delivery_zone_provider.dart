import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/restaurant/delivery_zone/delivery_zone_state.dart';
import 'package:rokctapp/manager/application/restaurant/delivery_zone/delivery_zone_notifier.dart';
import 'package:rokctapp/manager/domain/di/dependency_manager.dart';

final deliveryZoneProvider =
    StateNotifierProvider<DeliveryZoneNotifier, DeliveryZoneState>(
      (ref) => DeliveryZoneNotifier(usersRepository),
    );
