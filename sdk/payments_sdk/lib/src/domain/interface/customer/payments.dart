import 'package:rokctapp/customer/models/models.dart';
import 'package:core_sdk/core_sdk.dart';

abstract class PaymentsRepositoryFacade {
  Future<ApiResult<PaymentsResponse?>> getPayments();

  Future<ApiResult<TransactionsResponse>> createTransaction({
    required int orderId,
    required int paymentId,
  });
}
