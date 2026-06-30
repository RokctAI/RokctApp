import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:delivery_sdk/src/application/statistics/statistics_state.dart';
import 'package:delivery_sdk/src/application/statistics/statistics_notifier.dart';
import 'package:core_sdk/core_sdk.dart';

final statisticsProvider =
    StateNotifierProvider<StatisticsNotifier, StatisticsState>(
      (ref) => StatisticsNotifier(driverUserRepository),
    );

