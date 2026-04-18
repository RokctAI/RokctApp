import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/driver/application/statistics/statistics_state.dart';
import 'package:rokctapp/driver/application/statistics/statistics_notifier.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

final statisticsProvider =
    StateNotifierProvider<StatisticsNotifier, StatisticsState>(
      (ref) => StatisticsNotifier(UserRepository),
    );
