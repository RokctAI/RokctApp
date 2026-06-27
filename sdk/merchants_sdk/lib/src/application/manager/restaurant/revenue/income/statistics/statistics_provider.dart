import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:merchants_sdk/src/application/manager/restaurant/income/statistics/statistics_state.dart';
import 'package:merchants_sdk/src/application/manager/restaurant/income/statistics/statistics_notifier.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

final statisticsProvider =
    StateNotifierProvider<StatisticsNotifier, StatisticsState>(
      (ref) => StatisticsNotifier(managerUsersRepository),
    );
