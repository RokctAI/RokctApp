import 'package:core_sdk/core_sdk.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_details_state.freezed.dart';

@freezed
abstract class PosOrderDetailsState<T> with _$PosOrderDetailsState<T> {
  const factory PosOrderDetailsState({
    @Default(false) bool isLoading,
    @Default("") String status,
    @Default("") String detailStatus,
    @Default('') String usersQuery,
    @Default(false) bool isUsersLoading,
    @Default([]) List<dynamic> users,
    dynamic selectedUser,
    @Default(false) bool isUpdating,
    @Default([]) List<DropDownItemData> dropdownUsers,
    T? order,
  }) = _PosOrderDetailsState<T>;

  const PosOrderDetailsState._();
}
