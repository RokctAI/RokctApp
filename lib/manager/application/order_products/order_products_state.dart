import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:rokctapp/manager/infrastructure/models/models.dart';

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
