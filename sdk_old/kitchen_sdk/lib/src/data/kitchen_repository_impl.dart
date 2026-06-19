import 'package:core_sdk/core_sdk.dart';
import 'package:order_sdk/order_sdk.dart';
import '../domain/interface/kitchen.dart';

class KitchenRepositoryImpl implements KitchenRepositoryFacade {
  @override
  Future<ApiResult<List<OrderData>>> getKitchenOrders({
    required String status,
    int? page,
  }) async {
    // Implement Frappe network fetch and local drift cache syncing
    return ApiResult.success(data: []);
  }

  @override
  Future<ApiResult<OrderData>> updateOrderDetailStatus({
    required String status,
    required int? orderId,
  }) async {
    return ApiResult.success(data: OrderData());
  }

  @override
  Future<ApiResult<OrderData>> changeOrderStatus({
    required String status,
    required int? orderId,
  }) async {
    return ApiResult.success(data: OrderData());
  }
}
