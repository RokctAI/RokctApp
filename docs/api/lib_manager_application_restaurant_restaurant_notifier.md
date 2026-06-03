# API Reference: restaurant_notifier

Source file: `lib/manager/application/restaurant/restaurant_notifier.dart`

## Classes

### class `RestaurantNotifier`

## Whitelisted API Endpoints

### `RestaurantState()); Future<void> updateWorkingDays(List<ShopWorkingDays> days) async { final shop = state.shop?.copyWith(shopWorkingDays: days); LocalStorage.setShop(shop); state = state.copyWith(shop: shop); } Future<void> fetchMyShop({VoidCallback? afterFetched}) async { final response = await _usersRepository.getMyShop(); response.when( success: (data)`
*No documentation provided (generation failed).*

### `setPhone(String value)`
*No documentation provided (generation failed).*

### `setDescription(String value)`
*No documentation provided (generation failed).*

### `setTitle(String value)`
*No documentation provided (generation failed).*

### `setPayment(String value)`
*No documentation provided (generation failed).*

### `setLogoImageFile(String? file)`
*No documentation provided (generation failed).*

### `updateShop(BuildContext context, { VoidCallback? updateSuccess, }) async { if (state.backgroundImageFile == null && state.logoImageFile == null)`
*No documentation provided (generation failed).*

### `setBackgroundImageFile(String? file)`
*No documentation provided (generation failed).*

### `setOnlineOffline()`
*No documentation provided (generation failed).*
