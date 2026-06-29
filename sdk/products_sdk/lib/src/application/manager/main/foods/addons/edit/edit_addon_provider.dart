import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:products_sdk/src/application/manager/main/foods/addons/edit/edit_addon_state.dart';
import 'package:products_sdk/src/application/manager/main/foods/addons/edit/edit_addon_notifier.dart';
import 'package:core_sdk/core_sdk.dart';

final editAddonProvider =
    StateNotifierProvider<EditAddonNotifier, EditAddonState>(
      (ref) => EditAddonNotifier(managerProductRepository),
    );
