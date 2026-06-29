import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zones_sdk/src/models/customer/draw_routing_response.dart';

import 'package:core_sdk/core_sdk.dart';

abstract class DrawRepositoryFacade {
  Future<ApiResult<DrawRouting>> getRouting({
    required LatLng start,
    required LatLng end,
  });
}
