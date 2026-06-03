# API Reference: parcel_notifier

Source file: `lib/customer/application/parcel/parcel_notifier.dart`

## Classes

### class `ParcelNotifier`

## Whitelisted API Endpoints

### `build() => const ParcelState(); Future<void> addReview( BuildContext context, String comment, double rating, ) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `changeExpand()`
*No documentation provided (generation failed).*

### `setPayment(PaymentData selectPayment)`
*No documentation provided (generation failed).*

### `changeAnonymous()`
*No documentation provided (generation failed).*

### `fetchTypes(BuildContext context) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `getCalculate(BuildContext context) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `orderParcel({ required BuildContext context, required String note, required String usernameTo, required String usernameFrom, required String phoneTo, required String phoneFrom, required String houseFrom, required String houseTo, required String floorTo, required String floorFrom, required String comment, required String value, required String instruction, required num totalPrice, }) async { if (state.selectPayment == null)`
*No documentation provided (generation failed).*

### `ParcelListRoute()); break; default: parcelRepository.createTransaction( orderId: data ?? 0, paymentId: id, ); await makePayment( context, state.selectPayment?.tag ?? 'cash', data, ); if (context.mounted)`
*No documentation provided (generation failed).*

### `ParcelListRoute()); } break; } }, failure: (failure, status)`
*No documentation provided (generation failed).*

### `selectType({required int index, required BuildContext context})`
*No documentation provided (generation failed).*

### `setToAddress({ required String? title, required LocationData? location, required BuildContext context, })`
*No documentation provided (generation failed).*

### `setFromAddress({ required String? title, required LocationData? location, required BuildContext context, })`
*No documentation provided (generation failed).*

### `switchAddress({required BuildContext context})`
*No documentation provided (generation failed).*

### `setTime({required TimeOfDay time})`
*No documentation provided (generation failed).*

### `getResizedMarker(String assetPath, int width) async { final byteData = await rootBundle.load(assetPath); final codec = await instantiateImageCodec( byteData.buffer.asUint8List(), targetWidth: width, ); final frame = await codec.getNextFrame(); final data = await frame.image.toByteData(format: ImageByteFormat.png); return BitmapDescriptor.fromBytes(data!.buffer.asUint8List()); } Future<void> showParcel( BuildContext context, num orderId, bool isRefresh, ) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `MarkerId("Shop"): Marker( markerId: const MarkerId("Shop"), position: LatLng( data.addressFrom?.latitude ?? AppConstants.demoLatitude, data.addressFrom?.longitude ?? AppConstants.demoLongitude, ), icon: await getResizedMarker(Assets.userMarker, 100), ), const MarkerId("User"): Marker( markerId: const MarkerId("User"), position: LatLng( data.addressTo?.latitude ?? AppConstants.demoLatitude, data.addressTo?.longitude ?? AppConstants.demoLongitude, ), icon: await image.resizeAndCircle("", 120), ), }; state = state.copyWith(markers: list, isMapLoading: false); if (context.mounted)`
*No documentation provided (generation failed).*

### `MarkerId("Shop"): Marker( markerId: const MarkerId("Shop"), position: LatLng( data.addressFrom?.latitude ?? AppConstants.demoLatitude, data.addressFrom?.longitude ?? AppConstants.demoLongitude, ), icon: await getResizedMarker(Assets.userMarker, 100), ), const MarkerId("User"): Marker( markerId: const MarkerId("User"), position: LatLng( data.addressTo?.latitude ?? AppConstants.demoLatitude, data.addressTo?.longitude ?? AppConstants.demoLongitude, ), icon: await image.resizeAndCircle("", 120), ), }; state = state.copyWith(markers: list); } }, failure: (failure, status)`
*No documentation provided (generation failed).*

### `getRoutingAll({ required BuildContext context, required LatLng start, required LatLng end, }) async { if (await AppConnectivity.connectivity())`
*No documentation provided (generation failed).*
