import 'package:core_sdk/core_sdk.dart';
import 'package:wallet_sdk/wallet_sdk.dart';
import '../../models/response/subscriptions_response.dart';

abstract class SubscriptionsFacade {
  Future<ApiResult<SubscriptionResponse>> getSubscriptions({required int page, String? locale});

  Future<ApiResult> purchaseSubscription({
    required int id,
    required int paymentId,
  });

  Future<ApiResult<TransactionsResponse>> createTransaction({
    required int id,
    required int paymentId,
  });
}
