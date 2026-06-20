import 'package:orders_sdk/src/manager/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_details_state.freezed.dart';

@freezed
sealed class ManagerOrderDetailsState with _$ManagerOrderDetailsState {
  const factory ManagerOrderDetailsState({
    @Default(false) bool isLoading,
    @Default(false) bool isUpdating,
    OrderData? order,
  }) = _ManagerOrderDetailsState;

  const ManagerOrderDetailsState._();
}
