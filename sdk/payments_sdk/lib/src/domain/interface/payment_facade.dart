import 'package:core_sdk/core_sdk.dart';
import 'package:wallet_sdk/wallet_sdk.dart';

abstract class PaymentsFacade {
  Future<ApiResult<PaymentsResponse>> getPayments();

  Future<ApiResult<NonExistPaymentResponse>> getNonExistPayments();

  Future<ApiResult<MaksekeskusResponse>> paymentMaksekeskusView({num? price});

  Future<ApiResult<String>> paymentSubscriptionWebView({
    required String name,
    required int subscriptionId,
  });
}
