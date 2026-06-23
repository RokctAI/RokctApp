import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:merchants_sdk/src/application/manager/restaurant/income/today_orders/today_orders_state.dart';
import 'package:merchants_sdk/src/application/manager/restaurant/income/today_orders/today_orders_notifier.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

final todayOrdersProvider =
    StateNotifierProvider<TodayOrdersNotifier, TodayOrdersState>(
      (ref) => TodayOrdersNotifier(managerOrdersRepository),
    );
