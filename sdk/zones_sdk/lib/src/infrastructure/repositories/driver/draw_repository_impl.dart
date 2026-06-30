import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:core_sdk/core_sdk.dart';
import '../../domain/interface/driver/draw_repository.dart';
import '../../../models/customer/draw_routing_response.dart';
import 'package:core_sdk/core_sdk.dart'
    hide AppConstants, UploadType, OrderStatus;

class DrawRepositoryImpl implements DriverDrawRepository {
  @override
  Future<ApiResult<DrawRouting>> getRouting({
    required LatLng start,
    required LatLng end,
  }) async {
    try {
      final client = dioHttp.client(requireAuth: false, routing: true);
      final response = await client.get(
        '/v2/directions/driving-car?api_key=${AppConstants.routingKey}&start=${start.longitude},${start.latitude}&end=${end.longitude},${end.latitude}', // environment
      );
      return ApiResult.success(data: DrawRouting.fromJson(response.data));
    } catch (e) {
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }
}
