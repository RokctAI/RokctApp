import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:core_sdk/core_sdk.dart';

part 'addons_state.freezed.dart';

@freezed
sealed class AddonsState with _$AddonsState {
  const factory AddonsState({
    @Default(false) bool isLoading,
    @Default([]) List<ProductData> addons,
  }) = _AddonsState;

  const AddonsState._();
}
