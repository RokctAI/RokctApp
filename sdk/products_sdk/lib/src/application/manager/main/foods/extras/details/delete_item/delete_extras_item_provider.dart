import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/core/domain/di/dependency_manager.dart';
import 'package:products_sdk/src/application/manager/main/foods/extras/details/delete_item/delete_extras_item_notifier.dart';
import 'package:products_sdk/src/application/manager/main/foods/extras/details/delete_item/delete_extras_item_state.dart';

final deleteExtrasItemProvider =
    StateNotifierProvider<DeleteExtrasItemNotifier, DeleteExtrasItemState>(
      (ref) => DeleteExtrasItemNotifier(managerProductRepository),
    );
