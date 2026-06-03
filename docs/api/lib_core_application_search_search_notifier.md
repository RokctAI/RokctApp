# API Reference: search_notifier

Source file: `lib/core/application/search/search_notifier.dart`

## Classes

### class `SearchNotifier`

## Whitelisted API Endpoints

### `build() => const SearchState(); int productIndex = 1; void init()`
*No documentation provided (generation failed).*

### `setSelectCategory(int index, BuildContext context, {int? categoryId})`
*No documentation provided (generation failed).*

### `changeSearch(String text) async { List<String> list = List.from(state.searchHistory); if (text.isNotEmpty && !list.contains(text))`
*No documentation provided (generation failed).*

### `clearAllHistory()`
*No documentation provided (generation failed).*

### `clearHistory(int index)`
*No documentation provided (generation failed).*

### `searchShop(BuildContext context, String text, { int? categoryId, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `searchProduct(BuildContext context, String text) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `searchProductPage(BuildContext context, String text) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*
