import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:products_sdk/src/application/manager/main/foods/extras/extras_state.dart';
import 'package:products_sdk/src/application/manager/main/foods/extras/extras_notifier.dart';
import 'package:core_sdk/core_sdk.dart';

final extrasProvider = StateNotifierProvider<ExtrasNotifier, ExtrasState>(
  (ref) => ExtrasNotifier(managerProductRepository),
);
