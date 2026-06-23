import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:merchants_sdk/src/application/manager/restaurant/working_days/working_days_state.dart';
import 'package:merchants_sdk/src/application/manager/restaurant/working_days/working_days_notifier.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

final workingDaysProvider =
    StateNotifierProvider<WorkingDaysNotifier, WorkingDaysState>(
      (ref) => WorkingDaysNotifier(managerUsersRepository),
    );
