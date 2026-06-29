import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:products_sdk/src/application/manager/main/foods/addons/create/create_addon_state.dart';
import 'package:products_sdk/src/application/manager/main/foods/addons/create/create_addon_notifier.dart';
import 'package:core_sdk/core_sdk.dart';

final createAddonProvider =
    StateNotifierProvider<CreateAddonNotifier, CreateAddonState>(
      (ref) => CreateAddonNotifier(managerProductRepository),
    );
