# API Reference: delivery_zone_notifier

Source file: `lib/driver/application/delivery_zone/delivery_zone_notifier.dart`

## Classes

### class `DeliveryZoneNotifier`

## Whitelisted API Endpoints

### `DeliveryZoneState()); Future<void> updateDeliveryZone({VoidCallback? updateSuccess}) async { state = state.copyWith(isSaving: true); final response = await _usersRepository.updateDeliveryZones( points: state.tappedPoints, ); response.when( success: (data)`
*No documentation provided (generation failed).*

### `addTappedPoint(LatLng point)`
*No documentation provided (generation failed).*

### `PolygonId('1'), points: points, fillColor: AppStyle.primary.withValues(alpha: 0.3), strokeColor: AppStyle.primary, geodesic: false, strokeWidth: 4, ), ); } state = state.copyWith(tappedPoints: points, polygon: polygon); } Future<void> fetchDeliveryZone() async { state = state.copyWith(isLoading: true, tappedPoints: []); final response = await _usersRepository.getProfileDetails(); response.when( success: (data)`
*No documentation provided (generation failed).*

### `PolygonId('1'), points: points, fillColor: AppStyle.primary.withValues(alpha: 0.3), strokeColor: AppStyle.primary, geodesic: false, strokeWidth: 4, ), ); state = state.copyWith( deliveryZones: addresses, polygon: polygon, isLoading: false, ); } state = state.copyWith(isLoading: false); }, failure: (failure, stutus)`
*No documentation provided (generation failed).*
