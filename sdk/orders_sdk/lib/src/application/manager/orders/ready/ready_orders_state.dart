import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:core_sdk/core_sdk.dart';

part 'ready_orders_state.freezed.dart';

@freezed
sealed class ReadyOrdersState with _$ReadyOrdersState {
  const factory ReadyOrdersState({
    @Default(false) bool isLoading,
    @Default([]) List<OrderData> orders,
    @Default(0) int totalCount,
  }) = _ReadyOrdersState;

  const ReadyOrdersState._();
}

