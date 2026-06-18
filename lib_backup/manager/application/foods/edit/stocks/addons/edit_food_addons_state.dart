import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:rokctapp/manager/infrastructure/models/models.dart';

part 'edit_food_addons_state.freezed.dart';

@freezed
sealed class EditFoodAddonsState with _$EditFoodAddonsState {
  const factory EditFoodAddonsState({
    @Default(false) bool isLoading,
    @Default([]) List<ProductData> addons,
  }) = _EditFoodAddonsState;

  const EditFoodAddonsState._();
}
