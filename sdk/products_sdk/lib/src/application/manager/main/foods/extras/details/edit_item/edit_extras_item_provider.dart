import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/core/domain/di/dependency_manager.dart';
import 'package:products_sdk/src/application/manager/main/foods/extras/details/edit_item/edit_extras_item_notifier.dart';
import 'package:products_sdk/src/application/manager/main/foods/extras/details/edit_item/edit_extras_item_state.dart';

final editExtrasItemProvider =
    StateNotifierProvider<EditExtrasItemNotifier, EditExtrasItemState>(
      (ref) => EditExtrasItemNotifier(managerProductRepository),
    );
