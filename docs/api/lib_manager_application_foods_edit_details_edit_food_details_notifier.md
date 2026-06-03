# API Reference: edit_food_details_notifier

Source file: `lib/manager/application/foods/edit/details/edit_food_details_notifier.dart`

## Classes

### class `EditFoodDetailsNotifier`

## Whitelisted API Endpoints

### `EditFoodDetailsState()); void setTax(String value)`
*No documentation provided (generation failed).*

### `setInterval(String value)`
*No documentation provided (generation failed).*

### `setMaxQty(String value)`
*No documentation provided (generation failed).*

### `setMinQty(String value)`
*No documentation provided (generation failed).*

### `setActive(bool? value)`
*No documentation provided (generation failed).*

### `updateProduct(BuildContext context, { UnitData? unit, KitchenModel? kitchen, CategoryData? category, Function(ProductData?)? updated, VoidCallback? failed, }) async { state = state.copyWith(isLoading: true); setDesc(); List<String> imageUrl = List.from(state.listOfUrls.map((e) => e.path)); if (state.images.isNotEmpty)`
*No documentation provided (generation failed).*

### `setDesc()`
*No documentation provided (generation failed).*

### `setBarcode(String value)`
*No documentation provided (generation failed).*

### `setDescription(String value)`
*No documentation provided (generation failed).*

### `setTitle(String value)`
*No documentation provided (generation failed).*

### `setTitleTranslations(Map<String, String> translations)`
*No documentation provided (generation failed).*

### `setDescriptionTranslations(Map<String, String> translations)`
*No documentation provided (generation failed).*

### `setImageFile(String file)`
*No documentation provided (generation failed).*

### `setUploadImage(Galleries gallery)`
*No documentation provided (generation failed).*

### `deleteImage(String value)`
*No documentation provided (generation failed).*

### `setFoodDetails(ProductData? product)`
*No documentation provided (generation failed).*

### `getProductDetailsById(String productId) async { state = state.copyWith(isLoading: true); final response = await _productsRepository.getProductDetails(productId); response.when( success: (data) async { state = state.copyWith( product: data.data, isLoading: false, listOfUrls: data.data?.galleries ?? [], ); if (data.data?.translations != null)`
*No documentation provided (generation failed).*
