import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:core_sdk/core_sdk.dart';

part 'order_cart_state.freezed.dart';

@freezed
sealed class OrderCartState with _$OrderCartState {
  const factory OrderCartState({
    @Default([]) List<Stock> stocks,
    @Default(0) num totalPrice,
  }) = _OrderCartState;

  const OrderCartState._();
}

