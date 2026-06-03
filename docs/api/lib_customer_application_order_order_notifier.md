# API Reference: order_notifier

Source file: `lib/customer/application/order/order_notifier.dart`

## Classes

### class `OrderNotifier`

## Whitelisted API Endpoints

### `build() => const OrderState(); final ImageCropperForMarker imageCropper = ImageCropperForMarker(); void setAddressInfo({ String? office, String? house, String? floor, String? note, })`
*No documentation provided (generation failed).*

### `setUser({String? username, String? phone})`
*No documentation provided (generation failed).*

### `MarkerId("Driver"): Marker( markerId: const MarkerId("Driver"), position: LatLng( data.latitude ?? AppConstants.demoLatitude, data.longitude ?? AppConstants.demoLongitude, ), icon: await imageCropper.resizeAndCircle( state.orderData?.deliveryMan?.img ?? "", 120, ), ), }); state = state.copyWith(markers: list); }, failure: (failure, status)`
*No documentation provided (generation failed).*

### `checkBox(bool value)`
*No documentation provided (generation failed).*

### `changeActive(bool isChange)`
*No documentation provided (generation failed).*

### `setPromoCode(String? promoCode)`
*No documentation provided (generation failed).*

### `resetState()`
*No documentation provided (generation failed).*

### `changeTabIndex(int index)`
*No documentation provided (generation failed).*

### `setTimeAndDay(TimeOfDay timeOfDay, DateTime day)`
*No documentation provided (generation failed).*

### `checkWorkingDay()`
*No documentation provided (generation failed).*

### `Duration(days: 1))).toLowerCase(); final today = DateFormat("EEEE").format(now).toLowerCase(); TimeOfDay deliveryTime = TimeOfDay( hour: state.shopData?.deliveryTime?.type == 'hour' ? (int.tryParse(state.shopData?.deliveryTime?.to ?? '') ?? 0) : 0, minute: state.shopData?.deliveryTime?.type == 'minute' ? (int.tryParse(state.shopData?.deliveryTime?.to ?? '') ?? 0) : 0, ); debugPrint("today $today"); debugPrint("yesterday $yesterday"); debugPrint("deliveryTime $deliveryTime"); days?.forEach((element)`
*No documentation provided (generation failed).*

### `TimeOfDay(hour: 0, minute: 0); TimeOfDay time2 = time.plusMinutes( minute: deliveryTime.hour * 60 + deliveryTime.minute, ); for (int i = time.hour; i < element.to.toTimeOfDay.hour; i++)`
*No documentation provided (generation failed).*

### `TimeOfDay(hour: 0, minute: 0); TimeOfDay time2 = time.plusMinutes( minute: deliveryTime.hour * 60 + deliveryTime.minute, ); for (num i = time.hour; i < element.to.toTimeOfDay.hour; i)`
*No documentation provided (generation failed).*

### `changeBranch(int index)`
*No documentation provided (generation failed).*

### `fetchShop(BuildContext context, String uuid) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `MarkerId("Shop"), position: LatLng( data.data?.location?.latitude ?? AppConstants.demoLatitude, data.data?.location?.longitude ?? AppConstants.demoLongitude, ), icon: await imageCropper.resizeAndCircle( data.data?.logoImg ?? "", 120, ), ), ); state = state.copyWith(shopMarkers: list); }, failure: (failure, status)`
*No documentation provided (generation failed).*

### `fetchShopBranch(BuildContext context, int shopId) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `getCalculate({ required BuildContext context, required int cartId, required double long, required double lat, required DeliveryTypeEnum type, bool isLoading = true, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `LoginRoute()); } }, ); } else { if (context.mounted)`
*No documentation provided (generation failed).*

### `setNotes({required int stockId, required String note})`
*No documentation provided (generation failed).*

### `sendTips({ required BuildContext context, required num? price, required PaymentData payment, VoidCallback? onSuccess, ValueChanged<String>? onWebview, }) async { final num wallet = LocalStorage.getWalletData()?.price ?? 0; if (payment.tag == "wallet" && wallet < (price ?? 0))`
*No documentation provided (generation failed).*

### `createOrder({ required BuildContext context, required OrderBodyData data, required PaymentData payment, VoidCallback? onSuccess, Function(String, bool)? onWebview, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `MarkerId("Shop"): Marker( markerId: const MarkerId("Shop"), position: shopLatLng, icon: await getResizedMarker(Assets.imageMarker, 90), ), const MarkerId("User"): Marker( markerId: const MarkerId("User"), position: userLatLng, icon: await getResizedMarker(Assets.userMarker, 100), ), }; state = state.copyWith(markers: list, isMapLoading: false); if (context.mounted)`
*No documentation provided (generation failed).*

### `MarkerId("Shop"): Marker( markerId: const MarkerId("Shop"), position: shopLatLng, icon: await getResizedMarker(Assets.imageMarker, 90), ), const MarkerId("User"): Marker( markerId: const MarkerId("User"), position: userLatLng, icon: await getResizedMarker(Assets.userMarker, 100), ), }; state = state.copyWith(markers: list, isMapLoading: false); if (context.mounted)`
eref@fsdf.ff
4242424242424242
04/44
final response = await ordersRepository.createOrder(data);
response.when(
success: (data) async {
state = state.copyWith(
orderData: data,
isButtonLoading: false,
isMapLoading: true,
);
final LatLng shopLatLng = LatLng(
data.shop?.location?.latitude ?? AppConstants.demoLatitude,
data.shop?.location?.longitude ?? AppConstants.demoLongitude,
);
final LatLng userLatLng = LatLng(
data.location?.latitude ?? AppConstants.demoLatitude,
data.location?.longitude ?? AppConstants.demoLongitude,
);
Map<MarkerId, Marker> list = {

### `repeatOrder({ required BuildContext context, required int shopId, required VoidCallback onSuccess, List<OrderProduct>? listOfProduct, }) async { state = state.copyWith(isCheckShopOrder: false); if (shopId == 0)`
*No documentation provided (generation failed).*

### `getResizedMarker(String assetPath, int width) async { final byteData = await rootBundle.load(assetPath); final codec = await instantiateImageCodec( byteData.buffer.asUint8List(), targetWidth: width, ); final frame = await codec.getNextFrame(); final data = await frame.image.toByteData(format: ImageByteFormat.png); return BitmapDescriptor.fromBytes(data!.buffer.asUint8List()); } Future<void> showOrder( BuildContext context, num orderId, bool isRefresh, ) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `MarkerId("Shop"): Marker( markerId: const MarkerId("Shop"), position: shopLatLng, icon: await getResizedMarker(Assets.imageMarker, 90), ), const MarkerId("User"): Marker( markerId: const MarkerId("User"), position: userLatLng, icon: await getResizedMarker(Assets.userMarker, 100), ), }); state = state.copyWith(markers: list, isMapLoading: false); if (context.mounted)`
*No documentation provided (generation failed).*

### `MarkerId("Shop"): Marker( markerId: const MarkerId("Shop"), position: LatLng( data.shop?.location?.latitude ?? AppConstants.demoLatitude, data.shop?.location?.longitude ?? AppConstants.demoLongitude, ), icon: await getResizedMarker(Assets.imageMarker, 90), ), const MarkerId("User"): Marker( markerId: const MarkerId("User"), position: LatLng( data.location?.latitude ?? AppConstants.demoLatitude, data.location?.longitude ?? AppConstants.demoLongitude, ), icon: await getResizedMarker(Assets.userMarker, 100), ), }); state = state.copyWith(markers: list); } }, failure: (failure, status)`
*No documentation provided (generation failed).*

### `cancelOrder(BuildContext context, num orderId, VoidCallback onSuccess, ) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `refundOrder(BuildContext context, String title) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `addReview(BuildContext context, String comment, double rating, ) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `getRoutingAll({ required BuildContext context, required LatLng start, required LatLng end, }) async { if (await AppConnectivity.connectivity())`
*No documentation provided (generation failed).*

### `driverLocationUpdatedEvent(double lat, double lng) async { Set<Marker> markers = Set.from(state.shopMarkers); markers.removeWhere((e) => e.markerId.value == 'Deliveryman'); markers.add( Marker( markerId: MarkerId('Deliveryman'), position: LatLng(lat, lng), icon: await imageCropper.resizeAndCircle( state.orderData?.deliveryMan?.img ?? "", 120, ), ), ); debugPrint('driverLocationUpdatedEvent: $lat, $lng'); state = state.copyWith(shopMarkers: markers); } void orderUpdatedEvent(OrderActiveModel data)`
*No documentation provided (generation failed).*
