import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:rokctapp/manager/infrastructure/models/models.dart';

part 'working_days_state.freezed.dart';

@freezed
sealed class WorkingDaysState with _$WorkingDaysState {
  const factory WorkingDaysState({
    @Default(false) bool isLoading,
    @Default(0) int currentIndex,
    @Default([]) List<ShopWorkingDays> workingDays,
  }) = _WorkingDaysState;

  const WorkingDaysState._();
}
