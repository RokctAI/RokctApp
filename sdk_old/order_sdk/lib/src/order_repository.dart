import 'package:flutter/material.dart';
import 'package:core_sdk/core_sdk.dart';
import 'models/data/order_models.dart';

class OrderRepository {
  // --- Order Management ---
  Future<ApiResult<OrderResponse>> getOrders({required String status, int? page}) async {
    final data = {
      'status': status,
      if (page != null) 'page': page,
      'lang': LocalStorage.getLanguage()?.locale ?? 'en',
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get('/api/v1/dashboard/user/orders', queryParameters: data);
      return ApiResult.success(data: OrderResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get orders failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  Future<ApiResult<void>> createOrder({required Map<String, dynamic> orderData}) async {
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.post('/api/v1/dashboard/user/orders', data: orderData);
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> create order failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  // --- Product Catalog & Shops ---
  Future<ApiResult<ProductResponse>> getProducts({Map<String, dynamic>? query}) async {
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get('/api/v1/rest/products', queryParameters: query);
      return ApiResult.success(data: ProductResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get products failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  Future<ApiResult<ShopResponse>> getShops({Map<String, dynamic>? query}) async {
    try {
      final client = dioHttp.client(requireAuth: false);
      final response = await client.get('/api/v1/rest/shops', queryParameters: query);
      return ApiResult.success(data: ShopResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get shops failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }
}
