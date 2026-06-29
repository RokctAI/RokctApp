import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:core_sdk/core_sdk.dart';
import 'package:products_sdk/src/application/manager/main/foods/extras/details/new_item/create_new_group_item_notifier.dart';
import 'package:products_sdk/src/application/manager/main/foods/extras/details/new_item/create_new_group_item_state.dart';

final createNewGroupItemProvider =
    StateNotifierProvider<CreateNewGroupItemNotifier, CreateNewGroupItemState>(
      (ref) => CreateNewGroupItemNotifier(managerProductRepository),
    );
