import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:delivery_sdk/delivery_sdk.dart';
import 'package:core_sdk/core_sdk.dart';

abstract class DriverDrawRepository {
  Future<ApiResult<DrawRouting>> getRouting({
    required LatLng start,
    required LatLng end,
  });
}
