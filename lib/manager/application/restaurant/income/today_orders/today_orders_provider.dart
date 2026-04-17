import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/restaurant/income/today_orders/today_orders_state.dart';
import 'package:rokctapp/manager/application/restaurant/income/today_orders/today_orders_notifier.dart';
import 'package:rokctapp/domain/di/dependency_manager.dart';

final todayOrdersProvider =
    StateNotifierProvider<TodayOrdersNotifier, TodayOrdersState>(
      (ref) => TodayOrdersNotifier(ordersRepository),
    );
