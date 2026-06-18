import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/main/foods/extras/extras_state.dart';
import 'package:rokctapp/manager/application/main/foods/extras/extras_notifier.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

final extrasProvider = StateNotifierProvider<ExtrasNotifier, ExtrasState>(
  (ref) => ExtrasNotifier(managerProductRepository),
);
