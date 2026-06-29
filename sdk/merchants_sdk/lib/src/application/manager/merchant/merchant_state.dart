import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:merchants_sdk/merchants_sdk.dart';

part 'restaurant_state.freezed.dart';

@freezed
sealed class MerchantState with _$MerchantState {
  const factory MerchantState({
    @Default(false) bool isLoading,
    String? backgroundImageFile,
    String? logoImageFile,
    String? orderPayment,
    MerchantData? shop,
  }) = _MerchantState;

  const MerchantState._();
}
