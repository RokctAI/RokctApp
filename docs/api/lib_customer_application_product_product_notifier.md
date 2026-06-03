# API Reference: product_notifier

Source file: `lib/customer/application/product/product_notifier.dart`

## Classes

### class `ProductNotifier`

## Whitelisted API Endpoints

### `build() => const ProductState(); String? shareLink; void change(int index)`
*No documentation provided (generation failed).*

### `changeImage(Galleries image)`
*No documentation provided (generation failed).*

### `getProductDetails(BuildContext context, ProductData productData, String? shopType, int? shopId, ) async { final List<Stocks> stocks = productData.stocks ?? <Stocks>[]; state = state.copyWith( count: productData.minQty ?? 1, isCheckShopOrder: false, productData: productData, activeImageUrl: '${productData.img}', selectImage: Galleries(path: productData.img), initialStocks: stocks, ); generateShareLink(shopType, shopId); if (stocks.isNotEmpty)`
*No documentation provided (generation failed).*

### `getProductDetailsById(BuildContext context, String productId, String? shopType, int? shopId, { bool isLoading = true, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `addCount(BuildContext context)`
*No documentation provided (generation failed).*

### `disCount(BuildContext context)`
*No documentation provided (generation failed).*

### `createCart(BuildContext context, int shopId, VoidCallback onSuccess, { int? stockId, int? count, VoidCallback? onError, bool isGroupOrder = false, String? cartId, String? userUuid, }) async { state = state.copyWith(isCheckShopOrder: false); if (shopId == state.productData?.shopId)`
*No documentation provided (generation failed).*

### `updateSelectedIndexes(BuildContext context, int index, int value)`
*No documentation provided (generation failed).*

### `initialSetSelectedIndexes(BuildContext context, List<int> indexes)`
*No documentation provided (generation failed).*

### `updateExtras(BuildContext context)`
*No documentation provided (generation failed).*

### `updateIngredient(BuildContext context, int selectIndex)`
*No documentation provided (generation failed).*

### `addIngredient(BuildContext context, int selectIndex)`
*No documentation provided (generation failed).*

### `removeIngredient(BuildContext context, int selectIndex)`
*No documentation provided (generation failed).*

### `getSelectedStocks(List<Stocks> stocks, String value, int index)`
*No documentation provided (generation failed).*

### `getFirstExtras(int selectedIndex)`
*No documentation provided (generation failed).*

### `TypedExtra(type, extras, title, 0); } TypedExtra getUniqueExtras( List<TypedExtra> groupExtras, List<int> selectedIndexes, int index,)`
*No documentation provided (generation failed).*

### `TypedExtra(type, extras, title, index); } List<Stocks> getIncludedStocks( List<Stocks> includedStocks, int index, String includedValue,)`
*No documentation provided (generation failed).*

### `changeActiveImageUrl(String url)`
*No documentation provided (generation failed).*
