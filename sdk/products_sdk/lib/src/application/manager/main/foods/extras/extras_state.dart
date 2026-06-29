import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:core_sdk/core_sdk.dart';

part 'extras_state.freezed.dart';

@freezed
sealed class ExtrasState with _$ExtrasState {
  const factory ExtrasState({
    @Default(false) bool isLoading,
    @Default(false) bool isSaving,
    @Default([]) List<Group> groups,
  }) = _ExtrasState;

  const ExtrasState._();
}
