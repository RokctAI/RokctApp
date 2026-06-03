# API Reference: products_notifier

Source file: `lib/manager/application/product/products_notifier.dart`

## Classes

### class `ProductsNotifier`

## Whitelisted API Endpoints

### `ProductsState()); Future<void> setProductDetails({ required ProductData product, required List<Stock> cartStocks, }) async { final List<Stock> stocks = product.stocks ?? <Stock>[]; state = state.copyWith( productData: product, initialStocks: stocks, selectedStock: null, stockCount: 0, typedExtras: [], ); if (stocks.isNotEmpty)`
*No documentation provided (generation failed).*

### `getProductDetailsById(String productId) async { final response = await _productsRepository.getProductDetails(productId); response.when( success: (data) async { final List<Stock> stocks = data.data?.stocks ?? <Stock>[]; state = state.copyWith( productData: data.data, initialStocks: stocks, isLoading: false, ); if (stocks.isNotEmpty)`
*No documentation provided (generation failed).*

### `updateIngredient(BuildContext context, int selectIndex)`
*No documentation provided (generation failed).*

### `addIngredient(BuildContext context, int selectIndex)`
*No documentation provided (generation failed).*

### `removeIngredient(BuildContext context, int selectIndex)`
*No documentation provided (generation failed).*

### `updateSelectedIndexes(int index, int value, { required List<Stock> cartStocks, })`
*No documentation provided (generation failed).*

### `initialSetSelectedIndexes(List<int> indexes, { required List<Stock> cartStocks, })`
*No documentation provided (generation failed).*

### `updateExtras({required List<Stock> cartStocks})`
*No documentation provided (generation failed).*

### `getSelectedStocks(List<Stock> stocks, String value, int index)`
*No documentation provided (generation failed).*

### `getFirstExtras(int selectedIndex)`
*No documentation provided (generation failed).*

### `TypedExtra(type, extras, title, 0); } TypedExtra getUniqueExtras( List<TypedExtra> groupExtras, List<int> selectedIndexes, int index,)`
*No documentation provided (generation failed).*

### `TypedExtra(type, extras, title, index); } List<Stock> getIncludedStocks( List<Stock> includedStocks, int index, String includedValue,)`
*No documentation provided (generation failed).*

### `increaseStockCount({required Function(int) updateCart})`
*No documentation provided (generation failed).*

### `decreaseStockCount({required Function(int) updateCart})`
*No documentation provided (generation failed).*
