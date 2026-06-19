import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:rokctapp/manager/infrastructure/models/models.dart';

part 'addons_state.freezed.dart';

@freezed
sealed class AddonsState with _$AddonsState {
  const factory AddonsState({
    @Default(false) bool isLoading,
    @Default([]) List<ProductData> addons,
  }) = _AddonsState;

  const AddonsState._();
}
