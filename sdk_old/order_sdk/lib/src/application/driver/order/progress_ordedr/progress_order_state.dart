import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:rokctapp/driver/infrastructure/models/data/order_detail.dart';

part 'progress_order_state.freezed.dart';

@freezed
sealed class ProgressOrderState with _$ProgressOrderState {
  const factory ProgressOrderState({
    @Default(false) bool isLoading,
    @Default([]) List<OrderDetailData> progressOrders,
    @Default(0) num totalProgressOrder,
  }) = _ProgressOrderState;

  const ProgressOrderState._();
}
