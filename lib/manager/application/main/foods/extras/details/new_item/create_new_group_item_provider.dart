import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/domain/di/dependency_manager.dart';
import 'package:rokctapp/manager/application/main/foods/extras/details/new_item/create_new_group_item_notifier.dart';
import 'package:rokctapp/manager/application/main/foods/extras/details/new_item/create_new_group_item_state.dart';

final createNewGroupItemProvider =
    StateNotifierProvider<CreateNewGroupItemNotifier, CreateNewGroupItemState>(
      (ref) => CreateNewGroupItemNotifier(productRepository),
    );
