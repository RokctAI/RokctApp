import 'package:flutter/material.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:products_sdk/src/application/manager/foods/create/details/units/create_food_units_state.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:core_sdk/core_sdk.dart';

class CreateFoodUnitsNotifier extends StateNotifier<CreateFoodUnitsState> {
  final CatalogInterface _catalogRepository;

  CreateFoodUnitsNotifier(this._catalogRepository)
    : super(CreateFoodUnitsState(unitController: TextEditingController()));

  Future<void> fetchUnits(BuildContext context) async {
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
      failure: (failure, status) {
        state = state.copyWith(isLoading: false);
        AppHelpers.showCheckTopSnackBar(
          context,
          text: failure,
          type: SnackBarType.error,
        );
        debugPrint('====> fetch units fail $failure');
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
