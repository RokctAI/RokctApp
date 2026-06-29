import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:core_sdk/core_sdk.dart';
import 'package:products_sdk/src/application/manager/main/foods/addons/addons_notifier.dart';
import 'package:products_sdk/src/application/manager/main/foods/addons/addons_state.dart';

final addonsProvider = StateNotifierProvider<AddonsNotifier, AddonsState>(
  (ref) => AddonsNotifier(managerProductRepository),
);
