import 'package:flutter/material.dart';
import 'package:core_sdk/core_sdk.dart';
import 'models/data/delivery_models.dart';

class DeliveryRepository {
  Future<ApiResult<ParcelResponse>> getParcels({int? page}) async {
    final data = {
      if (page != null) 'page': page,
      'lang': LocalStorage.getLanguage()?.locale ?? 'en',
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get('/api/v1/dashboard/user/parcels', queryParameters: data);
      return ApiResult.success(data: ParcelResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get parcels failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  Future<ApiResult<void>> updateDriverLocation({
    required double latitude,
    required double longitude,
  }) async {
    final data = {
      'lat': latitude,
      'lng': longitude,
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.post('/api/v1/dashboard/deliveryman/settings/location', data: data);
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> update driver location failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }
}
