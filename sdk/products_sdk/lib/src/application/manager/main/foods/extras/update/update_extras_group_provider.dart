import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:products_sdk/src/application/manager/main/foods/extras/update/update_extras_group_state.dart';
import 'package:products_sdk/src/application/manager/main/foods/extras/update/update_extras_group_notifier.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

final updateExtrasGroupProvider =
    StateNotifierProvider<UpdateExtrasGroupNotifier, UpdateExtrasGroupState>(
      (ref) => UpdateExtrasGroupNotifier(managerProductRepository),
    );
