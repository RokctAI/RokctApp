import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:merchants_sdk/src/application/manager/restaurant/income/today_orders/today_orders_state.dart';
import 'package:merchants_sdk/src/application/manager/restaurant/income/today_orders/today_orders_notifier.dart';
import 'package:core_sdk/core_sdk.dart';

final todayOrdersProvider =
    StateNotifierProvider<TodayOrdersNotifier, TodayOrdersState>(
      (ref) => TodayOrdersNotifier(managerOrdersRepository),
    );
