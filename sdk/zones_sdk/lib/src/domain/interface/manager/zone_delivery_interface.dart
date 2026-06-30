import 'package:core_sdk/core_sdk.dart';

/// Interface for manager delivery zone operations.
/// Implemented by users_sdk's UsersRepository but declared here
/// so zones_sdk has no direct dependency on users_sdk.
abstract class ZoneDeliveryInterface {
  Future<ApiResult<dynamic>> updateDeliveryZones({required List<dynamic> points});
  Future<ApiResult<dynamic>> getDeliveryZone();
}
