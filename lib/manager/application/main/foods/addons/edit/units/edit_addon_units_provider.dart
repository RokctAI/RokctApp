import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/domain/di/dependency_manager.dart';
import 'package:rokctapp/manager/application/main/foods/addons/edit/units/edit_addon_units_notifier.dart';
import 'package:rokctapp/manager/application/main/foods/addons/edit/units/edit_addon_units_state.dart';

final editAddonUnitsProvider =
    StateNotifierProvider<EditAddonUnitsNotifier, EditAddonUnitsState>(
      (ref) => EditAddonUnitsNotifier(catalogRepository),
    );
