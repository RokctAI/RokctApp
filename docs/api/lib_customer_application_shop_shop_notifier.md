# API Reference: shop_notifier

Source file: `lib/customer/application/shop/shop_notifier.dart`

## Classes

### class `ShopNotifier`

## Whitelisted API Endpoints

### `build() => const ShopState(); int page = 1; List<String> _list = []; String? shareLink; void showWeekTime()`
*No documentation provided (generation failed).*

### `showBranch()`
*No documentation provided (generation failed).*

### `enableSearch()`
*No documentation provided (generation failed).*

### `getRoutingAll({ required BuildContext context, required LatLng start, required LatLng end, }) async { if (await AppConnectivity.connectivity())`
*No documentation provided (generation failed).*

### `changeMap({required LatLng shopLocation}) async { state = state.copyWith(isMapLoading: true); final ImageCropperForMarker image = ImageCropperForMarker(); Set<Marker> markers = {}; markers.addAll({ Marker( markerId: const MarkerId("shop"), position: shopLocation, icon: await image.resizeAndCircle(state.shopData?.logoImg ?? "", 120), ), Marker( markerId: const MarkerId("user"), position: LatLng( LocalStorage.getAddressSelected()?.location?.latitude ?? AppConstants.demoLatitude, LocalStorage.getAddressSelected()?.location?.longitude ?? AppConstants.demoLongitude, ), icon: await image.resizeAndCircle(LocalStorage.getUser()?.img, 120), ), }); state = state.copyWith(isMapLoading: false, shopMarkers: markers); } Future<void> getMarker() async { state = state.copyWith( isMapLoading: true, showBranch: false, showWeekTime: false, ); final ImageCropperForMarker image = ImageCropperForMarker(); Set<Marker> markers = {}; markers.addAll({ Marker( markerId: const MarkerId("shop"), position: LatLng( state.shopData?.location?.latitude ?? AppConstants.demoLatitude, state.shopData?.location?.longitude ?? AppConstants.demoLongitude, ), icon: await image.resizeAndCircle(state.shopData?.logoImg ?? "", 120), ), Marker( markerId: const MarkerId("user"), position: LatLng( LocalStorage.getAddressSelected()?.location?.latitude ?? AppConstants.demoLatitude, LocalStorage.getAddressSelected()?.location?.longitude ?? AppConstants.demoLongitude, ), icon: await image.resizeAndCircle(LocalStorage.getUser()?.img, 120), ), }); state = state.copyWith(shopMarkers: markers, isMapLoading: false); final res = await shopsRepository.getShopBranch( uuid: state.shopData?.id ?? "", ); res.when( success: (data)`
*No documentation provided (generation failed).*

### `onLike()`
*No documentation provided (generation failed).*

### `changeIndex(int index)`
*No documentation provided (generation failed).*

### `changeSearchText(String text)`
*No documentation provided (generation failed).*

### `changeSubIndex(int index)`
*No documentation provided (generation failed).*

### `checkWorkingDay()`
*No documentation provided (generation failed).*

### `setShop(ShopData shop) async { _list = LocalStorage.getSavedShopsList(); for (String e in _list)`
*No documentation provided (generation failed).*

### `leaveGroup()`
*No documentation provided (generation failed).*

### `joinOrder(BuildContext context, String shopId, String cartId, String name, VoidCallback onSuccess, ) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchShop(BuildContext context, String uuid) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchCategory(BuildContext context, String shopId) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchProducts(BuildContext context, String shopId, ValueChanged<int> onSuccess, ) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `checkProductsPopular(BuildContext context, String shopId) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchProductsByCategory(BuildContext context, String shopId, String categoryId, ) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchBrands(BuildContext context, int categoryId) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `setBrands({required int id})`
*No documentation provided (generation failed).*

### `clear()`
*No documentation provided (generation failed).*

### `changeSort(int index)`
*No documentation provided (generation failed).*
