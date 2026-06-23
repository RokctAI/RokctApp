import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:merchants_sdk/src/application/manager/restaurant/restaurant_state.dart';
import 'package:merchants_sdk/src/application/manager/restaurant/restaurant_notifier.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

final restaurantProvider =
    StateNotifierProvider<RestaurantNotifier, RestaurantState>(
      (ref) =>
          RestaurantNotifier(managerUsersRepository, managerSettingsRepository),
    );
