import 'package:rokctapp/core/infrastructure/models/models.dart';
import 'package:rokctapp/core/domain/handlers/handlers.dart';

abstract class PaymentsRepositoryFacade {
  Future<ApiResult<PaymentsResponse?>> getPayments();

  Future<ApiResult<TransactionsResponse>> createTransaction({
    required int orderId,
    required int paymentId,
  });
}
