

import 'package:freezed_annotation/freezed_annotation.dart';

part 'kitchen_state.freezed.dart';

@freezed
abstract class KitchenState<T> with _$KitchenState<T> {
  const factory KitchenState({
    @Default(true) bool isLoading,
    @Default("all") String selectType,
    @Default(true) bool hasMore,
    @Default("") String detailStatus,
    @Default(false) bool isUpdatingStatus,
    @Default([]) List<T> orders,
    @Default(null) T? selectOrder,
    @Default('') String query,
    @Default(0) int selectIndex,
  }) = _KitchenState<T>;

  const KitchenState._();
}
