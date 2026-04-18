import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/domain/di/dependency_manager.dart';
import 'package:rokctapp/manager/application/main/foods/addons/addons_notifier.dart';
import 'package:rokctapp/manager/application/main/foods/addons/addons_state.dart';

final addonsProvider = StateNotifierProvider<AddonsNotifier, AddonsState>(
  (ref) => AddonsNotifier(productRepository),
);
