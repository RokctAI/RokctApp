# API Reference: home_notifier

Source file: `lib/driver/application/home/home_notifier.dart`

## Classes

### class `HomeNotifier`

## Whitelisted API Endpoints

### `HomeState()); final ImageCropperMarker image = ImageCropperMarker(); Future<void> fetchDeliveryZone({bool isFetch = false}) async { if (isFetch)`
*No documentation provided (generation failed).*

### `PolygonId("zone"), points: points, fillColor: AppStyle.primary.withValues(alpha: 0.01), strokeColor: AppStyle.primary, geodesic: false, strokeWidth: 8, ), ); state = state.copyWith( polygon: polygon, isLoading: false, deliveryZone: points, ); } } void scrolling(bool scroll)`
*No documentation provided (generation failed).*

### `getRoutingAll({ required BuildContext context, required LatLng start, required LatLng end, required Marker market, }) async { if (await AppConnectivity.connectivity())`
*No documentation provided (generation failed).*

### `getRouting({ required BuildContext context, required LatLng start, required bool isOnline, }) async { if (await AppConnectivity.connectivity())`
*No documentation provided (generation failed).*

### `goMarket({ required BuildContext context, String? orderId, OrderDetailData? order, bool setOrder = false, required VoidCallback onSuccess, }) async { state = state.copyWith(isGoUser: false, isLoading: true); if (await AppConnectivity.connectivity())`
*No documentation provided (generation failed).*

### `goMarketParcel({ required BuildContext context, String? parcelId, ParcelOrder? parcel, bool setOrder = false, }) async { state = state.copyWith( isGoRestaurant: true, isGoUser: false, isLoading: true, ); if (await AppConnectivity.connectivity())`
*No documentation provided (generation failed).*

### `fetchCurrentOrder(BuildContext context) async { fetchDeliveryZone(); state = state.copyWith(isGoRestaurant: false, isGoUser: false); if (await AppConnectivity.connectivity())`
*No documentation provided (generation failed).*

### `MarkerId("User"), position: LatLng( double.parse(data.data?.first.location?.latitude ?? "0"), double.parse(data.data?.first.location?.longitude ?? "0"), ), icon: await image.resizeAndCircle( data.data?.first.user?.img ?? "", 100, ), ), ); state = state.copyWith( isGoRestaurant: false, isGoUser: true, isLoading: false, ); } else { state = state.copyWith(isGoRestaurant: true, isGoUser: false); getRoutingAll( context: context, start: LatLng( LocalStorage.getAddressSelected()?.latitude ?? AppConstants.demoLatitude, LocalStorage.getAddressSelected()?.longitude ?? AppConstants.demoLongitude, ), end: LatLng( double.parse( data.data?.first.shop?.location?.latitude ?? "0", ), double.parse( data.data?.first.shop?.location?.longitude ?? "0", ), ), market: Marker( markerId: const MarkerId("Shop"), position: LatLng( double.parse( data.data?.first.shop?.location?.latitude ?? "0", ), double.parse( data.data?.first.shop?.location?.longitude ?? "0", ), ), icon: await image.resizeAndCircle( data.data?.first.shop?.logoImg ?? "", 120, ), ), ); } } }, failure: (failure, status)`
*No documentation provided (generation failed).*

### `goClient(BuildContext context, int? orderId, { OrderDetailData? order, }) async { state = state.copyWith(isGoUser: true, isGoRestaurant: false); if (await AppConnectivity.connectivity())`
*No documentation provided (generation failed).*

### `goClientParcel(BuildContext context, int? parcelId, { ParcelOrder? parcel, }) async { state = state.copyWith(isGoUser: true, isGoRestaurant: false); if (await AppConnectivity.connectivity())`
*No documentation provided (generation failed).*

### `addReview({ required BuildContext context, String? comment, double? rating, int? orderId, }) async { if (await AppConnectivity.connectivity())`
*No documentation provided (generation failed).*

### `addReviewParcel({ required BuildContext context, String? comment, double? rating, int? parcelId, }) async { if (await AppConnectivity.connectivity())`
*No documentation provided (generation failed).*

### `deliveredFinishParcel({ required BuildContext context, int? parcelId, }) async { state = state.copyWith( isGoUser: false, isGoRestaurant: false, polylineCoordinates: [], endPolylineCoordinates: [], markers: {}, ); if (await AppConnectivity.connectivity())`
*No documentation provided (generation failed).*

### `deliveredFinish({ required BuildContext context, int? orderId, }) async { state = state.copyWith( isGoUser: false, isGoRestaurant: false, polylineCoordinates: [], endPolylineCoordinates: [], markers: {}, ); if (await AppConnectivity.connectivity())`
*No documentation provided (generation failed).*

### `cancelOrder({ required BuildContext context, required int orderId, required String note, }) async { state = state.copyWith(isLoading: true); if (await AppConnectivity.connectivity())`
*No documentation provided (generation failed).*

### `uploadImage({ required BuildContext context, required int? orderId, required String path, }) async { final res = await driverSettingsRepository.uploadImage( path, UploadType.products, ); res.when( success: (success)`
*No documentation provided (generation failed).*

### `setOnline({required BuildContext context}) async { if (await AppConnectivity.connectivity())`
*No documentation provided (generation failed).*
