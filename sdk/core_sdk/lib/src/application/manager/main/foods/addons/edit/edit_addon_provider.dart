import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/main/foods/addons/edit/edit_addon_state.dart';
import 'package:rokctapp/manager/application/main/foods/addons/edit/edit_addon_notifier.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

final editAddonProvider =
    StateNotifierProvider<EditAddonNotifier, EditAddonState>(
      (ref) => EditAddonNotifier(managerProductRepository),
    );
