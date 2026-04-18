import 'package:flutter/material.dart';
import 'package:rokctapp/core/domain/handlers/handlers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/main/foods/addons/create/units/create_addon_units_state.dart';
import 'package:rokctapp/manager/domain/interface/interfaces.dart';
import 'package:rokctapp/manager/infrastructure/models/models.dart';

class CreateAddonUnitsNotifier extends AutoDisposeNotifier<CreateAddonUnitsState> {
  final CatalogInterface _catalogRepository;

  CreateAddonUnitsNotifier(this._catalogRepository)
    : super(CreateAddonUnitsState(unitController: TextEditingController()));

  Future<void> fetchUnits() async {
    if (state.units.isNotEmpty) {
      return;
    }
    state = state.copyWith(isLoading: true);
    final response = await _catalogRepository.getUnits();
    response.when(
      success: (data) {
        final List<UnitData> units = data.data ?? [];
        state = state.copyWith(units: units, isLoading: false);
        if (units.isNotEmpty) {
          state.unitController?.text =
              units[state.activeIndex].translation?.title ?? '';
        }
      },
      f: (f, s) {
        state = state.copyWith(isLoading: false);
        debugPrint('====> fetch units f $f');
      },
    );
  }

  void setActiveIndex(int index) {
    if (state.activeIndex == index) {
      return;
    }
    state = state.copyWith(activeIndex: index);
    state.unitController?.text = state.units[index].translation?.title ?? '';
  }
}
