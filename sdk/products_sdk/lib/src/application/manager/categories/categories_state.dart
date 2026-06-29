import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:core_sdk/core_sdk.dart';

part 'categories_state.freezed.dart';

@freezed
sealed class CategoriesState with _$CategoriesState {
  const factory CategoriesState({
    @Default(false) bool isLoading,
    @Default(false) bool isComboLoading,
    @Default([]) List<CategoryData> categories,
    @Default([]) List<CategoryData> comboCategories,
    @Default(1) int activeIndex,
    @Default(1) int activeComboIndex,
  }) = _CategoriesState;

  const CategoriesState._();
}
