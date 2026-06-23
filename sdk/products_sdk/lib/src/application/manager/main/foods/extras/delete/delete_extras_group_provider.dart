import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/core/domain/di/dependency_manager.dart';
import 'package:products_sdk/src/application/manager/main/foods/extras/delete/delete_extras_group_notifier.dart';
import 'package:products_sdk/src/application/manager/main/foods/extras/delete/delete_extras_group_state.dart';

final deleteExtrasGroupProvider =
    StateNotifierProvider<DeleteExtrasGroupNotifier, DeleteExtrasGroupState>(
      (ref) => DeleteExtrasGroupNotifier(managerProductRepository),
    );
