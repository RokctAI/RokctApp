# API Reference: home_notifier

Source file: `lib/customer/application/home/home_notifier.dart`

## Classes

### class `HomeNotifier`

## Whitelisted API Endpoints

### `build()`
*No documentation provided (generation failed).*

### `HomeState(); } int categoryIndex = 1; int shopIndex = 1; int newShopIndex = 1; int marketIndex = 1; int storyIndex = 1; int bannerIndex = 1; int shopRefreshIndex = 1; int marketRefreshIndex = 1; void setAddress([AddressNewModel? data]) async { AddressData? addressData = LocalStorage.getAddressSelected(); state = state.copyWith( addressData: data ?? AddressNewModel( title: addressData?.title ?? "", address: AddressInformation(address: addressData?.address ?? ""), location: [ addressData?.location?.latitude, addressData?.location?.longitude, ], ), ); } void setSelectCategory(int index, BuildContext context)`
*No documentation provided (generation failed).*

### `setSelectSubCategory(int index, BuildContext context)`
*No documentation provided (generation failed).*

### `fetchCategories(BuildContext context) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchAdsById(BuildContext context, int bannerId) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchBannerById(BuildContext context, int bannerId) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchCategoriesPage(BuildContext context, RefreshController controller, { bool isRefresh = false, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchShop(BuildContext context) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchShopPage(BuildContext context, RefreshController shopController, { bool isRefresh = false, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchRestaurant(BuildContext context) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchRestaurantPage(BuildContext context, RefreshController shopController, { bool isRefresh = false, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchRestaurantNew(BuildContext context) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchRestaurantPageNew(BuildContext context, RefreshController shopController, { bool isRefresh = false, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchShopRecommend(BuildContext context) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchStorePage(BuildContext context, RefreshController shopController, { bool isRefresh = false, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchStore(BuildContext context) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchShopPageRecommend(BuildContext context, RefreshController shopController, { bool isRefresh = false, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchBanner(BuildContext context) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchAds(BuildContext context) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchBannerPage(BuildContext context, RefreshController controller, { bool isRefresh = false, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchFilterRestaurant(BuildContext context, { bool? isRefresh, RefreshController? controller, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*
