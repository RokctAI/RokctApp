import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:rokctapp/driver/infrastructure/models/models.dart';
import 'package:rokctapp/core/domain/handlers/handlers.dart';

abstract class DriverDrawRepository {
  Future<ApiResult<DrawRouting>> getRouting({
    required LatLng start,
    required LatLng end,
  });
}
