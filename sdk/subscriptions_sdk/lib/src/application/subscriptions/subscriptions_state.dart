import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:wallet_sdk/wallet_sdk.dart';
import '../../models/data/subscriptions_data.dart';

part 'subscriptions_state.freezed.dart';

@freezed
sealed class SubscriptionState with _$SubscriptionState {
  const factory SubscriptionState({
    @Default(false) bool isLoading,
    @Default(false) bool isPaymentLoading,
    @Default(1) int selectPayment,
    @Default(0) int selectSubscribe,
    @Default([]) List<SubscriptionData> list,
    @Default([]) List<PaymentData>? payments,
  }) = _SubscriptionState;

  const SubscriptionState._();
}
