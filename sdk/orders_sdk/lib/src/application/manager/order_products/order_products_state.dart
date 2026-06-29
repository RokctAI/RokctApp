import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:core_sdk/core_sdk.dart';

part 'order_products_state.freezed.dart';

@freezed
sealed class OrderProductsState with _$OrderProductsState {
  const factory OrderProductsState({
    @Default(false) bool isLoading,
    @Default([]) List<ProductData> products,
    @Default('single') String productType,
  }) = _OrderProductsState;

  const OrderProductsState._();
}

