import 'package:core_sdk/core_sdk.dart';
import 'package:order_sdk/order_sdk.dart';

abstract class KitchenRepositoryFacade {
  Future<ApiResult<List<OrderData>>> getKitchenOrders({
    required String status,
    int? page,
  });

  Future<ApiResult<OrderData>> updateOrderDetailStatus({
    required String status,
    required int? orderId,
  });

  Future<ApiResult<OrderData>> changeOrderStatus({
    required String status,
    required int? orderId,
  });
}
