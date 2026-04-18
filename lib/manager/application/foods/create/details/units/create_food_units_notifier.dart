import 'package:flutter/material.dart';
import 'package:rokctapp/core/domain/handlers/handlers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokctapp/manager/infrastructure/services/services.dart';
import 'package:rokctapp/manager/application/foods/create/details/units/create_food_units_state.dart';
import 'package:rokctapp/manager/domain/interface/interfaces.dart';
import 'package:rokctapp/manager/infrastructure/models/models.dart';

class CreateFoodUnitsNotifier extends AutoDisposeNotifier<CreateFoodUnitsState> {
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
      f: (f, s) {
        state = state.copyWith(isLoading: false);
        AppHelpers.showCheckTopSnackBar(
          context,
          text: f,
          type: SnackBarType.error,
        );
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
