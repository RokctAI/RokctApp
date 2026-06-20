abstract class KitchenRepository<ResultType, DetailResultType, StatusType> {
  Future<ResultType> getKitchenOrders({
    String? status,
    int? page,
    String? search,
  });

  Future<DetailResultType> getOrderDetailsKitchen({
    int? orderId,
  });

  Future<ResultType> updateOrderDetailStatus({
    required String status,
    int? orderId,
  });

  Future<ResultType> updateOrderStatusKitchen({
    required StatusType status,
    int? orderId,
  });
}
