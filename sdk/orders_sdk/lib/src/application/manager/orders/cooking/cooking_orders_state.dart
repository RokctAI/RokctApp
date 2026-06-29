import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:core_sdk/core_sdk.dart';

part 'cooking_orders_state.freezed.dart';

@freezed
sealed class CookingOrdersState with _$CookingOrdersState {
  const factory CookingOrdersState({
    @Default(false) bool isLoading,
    @Default([]) List<OrderData> orders,
    @Default(0) int totalCount,
  }) = _CookingOrdersState;

  const CookingOrdersState._();
}

