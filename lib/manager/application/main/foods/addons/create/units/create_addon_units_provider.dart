import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/domain/di/dependency_manager.dart';
import 'package:rokctapp/manager/application/main/foods/addons/create/units/create_addon_units_notifier.dart';
import 'package:rokctapp/manager/application/main/foods/addons/create/units/create_addon_units_state.dart';

final createAddonUnitsProvider =
    StateNotifierProvider<CreateAddonUnitsNotifier, CreateAddonUnitsState>(
      (ref) => CreateAddonUnitsNotifier(catalogRepository),
    );
