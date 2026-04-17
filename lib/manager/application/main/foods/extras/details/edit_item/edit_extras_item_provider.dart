import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:venderfoodyman/domain/di/dependency_manager.dart';
import 'package:rokctapp/manager/application/main/foods/extras/details/edit_item/edit_extras_item_notifier.dart';
import 'package:rokctapp/manager/application/main/foods/extras/details/edit_item/edit_extras_item_state.dart';

final editExtrasItemProvider =
    StateNotifierProvider<EditExtrasItemNotifier, EditExtrasItemState>(
      (ref) => EditExtrasItemNotifier(productRepository),
    );
