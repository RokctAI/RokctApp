# API Reference: foods_notifier

Source file: `lib/manager/application/foods/foods_notifier.dart`

## Classes

### class `FoodsNotifier`

## Whitelisted API Endpoints

### `FoodsState()); Future<void> fetchMoreProducts({RefreshController? refreshController}) async { if (!_hasMore)`
*No documentation provided (generation failed).*

### `fetchCategoryProducts({ int? categoryId, RefreshController? refreshController, }) async { _categoryId = categoryId; refreshController?.resetNoData(); _hasMore = true; _page = 0; state = state.copyWith(isLoading: true); final response = await _productsRepository.getProducts( categoryId: _categoryId, query: _query.isEmpty ? null : _query.trim(), page: ++_page, type: _productType, ); response.when( success: (data)`
*No documentation provided (generation failed).*

### `initialFetchFoods() async { if (state.foods.isNotEmpty)`
*No documentation provided (generation failed).*

### `refreshProducts({RefreshController? refreshController}) async { refreshController?.resetNoData(); _hasMore = true; _page = 0; final response = await _productsRepository.getProducts( page: ++_page, categoryId: _categoryId, query: _query.isEmpty ? null : _query.trim(), type: _productType, ); response.when( success: (data)`
*No documentation provided (generation failed).*

### `updateSingleProduct(ProductData? product)`
*No documentation provided (generation failed).*

### `setProductType(String type, {RefreshController? refreshController})`
*No documentation provided (generation failed).*

### `setQuery({required String query, int? categoryId})`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 500), ()`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 500), ()`
*No documentation provided (generation failed).*

### `fetchProducts({ RefreshController? refreshController, bool isRefresh = false, bool isOpeningPage = false, int? categoryId, }) async { if (isRefresh)`
*No documentation provided (generation failed).*
