import 'package:core_sdk/core_sdk.dart';
import 'order_repository.dart';
import 'models/data/order_models.dart';

class OrderSDK {
  final OrderRepository _repository = OrderRepository();

  Future<List<dynamic>> getActiveOrders({int page = 1}) async {
    final res = await _repository.getOrders(status: "active", page: page);
    return res.when(
      success: (response) => response.data ?? [],
      failure: (err, status) {
        throw Exception(err.toString());
      },
    );
  }

  Future<List<dynamic>> getProducts({Map<String, dynamic>? query}) async {
    final res = await _repository.getProducts(query: query);
    return res.when(
      success: (response) => response.data ?? [],
      failure: (err, status) {
        throw Exception(err.toString());
      },
    );
  }

  Future<List<dynamic>> getShops({Map<String, dynamic>? query}) async {
    final res = await _repository.getShops(query: query);
    return res.when(
      success: (response) => response.data ?? [],
      failure: (err, status) {
        throw Exception(err.toString());
      },
    );
  }

  OrderRepository get repository => _repository;
}
