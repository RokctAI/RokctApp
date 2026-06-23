import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/core/domain/di/dependency_manager.dart';
import 'package:products_sdk/src/application/manager/main/foods/addons/edit/units/edit_addon_units_notifier.dart';
import 'package:products_sdk/src/application/manager/main/foods/addons/edit/units/edit_addon_units_state.dart';

final editAddonUnitsProvider =
    StateNotifierProvider<EditAddonUnitsNotifier, EditAddonUnitsState>(
      (ref) => EditAddonUnitsNotifier(managerCatalogRepository),
    );
