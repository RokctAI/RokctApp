import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:rokctapp/manager/infrastructure/models/models.dart';

part 'foods_state.freezed.dart';

@freezed
sealed class FoodsState with _$FoodsState {
  const factory FoodsState({
    @Default(false) bool isLoading,
    @Default([]) List<ProductData> foods,
    @Default('single') String productType,
  }) = _FoodsState;
  const FoodsState._();
}
