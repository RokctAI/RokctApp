import 'package:core_sdk/core_sdk.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:zones_sdk/src/domain/interface/customer/draw.dart';
import 'package:zones_sdk/src/models/customer/draw_routing_response.dart';
import 'package:core_sdk/core_sdk.dart';

class DrawRepository implements DrawRepositoryFacade {
  @override
  Future<ApiResult<DrawRouting>> getRouting({
    required LatLng start,
    required LatLng end,
  }) async {
    try {
      final client = dioHttp.client(requireAuth: false, routing: true);
      final response = await client.get(
        '/v2/directions/driving-car',
        queryParameters: {
          "api_key": AppConstants.routingKey,
          "start": "${start.longitude},${start.latitude}",
          "end": "${end.longitude},${end.latitude}",
        },
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
