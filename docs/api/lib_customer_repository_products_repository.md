# API Reference: products_repository

Source file: `lib/customer/repository/products_repository.dart`

## Classes

### class `ProductsRepository`

## Whitelisted API Endpoints

### `searchProducts({ required String text, int? page, }) async { final data = SearchProductModel(text: text, page: page ?? 1); try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/products/paginate', queryParameters: data.toJson(), ); return ApiResult.success( data: ProductsPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getProductDetails(String uuid, ) async { final data = { if (LocalStorage.getSelectedCurrency() != null) 'currency_id': LocalStorage.getSelectedCurrency()?.id, 'lang': LocalStorage.getLanguage()?.locale, }; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/products/$uuid', queryParameters: data, ); return ApiResult.success( data: SingleProductResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getProductsByCategoryPaginate({ String? shopId, required int page, required int categoryId, }) async { final data = ProductRequest( shopId: shopId!, page: page, categoryId: categoryId, ); try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/products/paginate', queryParameters: data.toJsonByCategory(), ); return ApiResult.success( data: ProductsPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getProductsPaginate({ String? shopId, required int page, }) async { final data = ProductRequest(shopId: shopId!, page: page); try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/products/paginate', queryParameters: data.toJson(), ); return ApiResult.success( data: ProductsPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getAllProducts({ required String shopId, }) async { try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/shops/$shopId/products', queryParameters: { "lang": LocalStorage.getLanguage()?.locale, "currency_id": LocalStorage.getSelectedCurrency()?.id, }, ); return ApiResult.success( data: AllProductsResponse.fromJson(response.data), ); } catch (e, s)`
*No documentation provided (generation failed).*

### `getProductsShopByCategoryPaginate({ String? shopId, List<int>? brands, int? sortIndex, required int page, required int categoryId, }) async { final Map<String, Dyn> data = { "shop_id": shopId, "lang": LocalStorage.getLanguage()?.locale ?? "en", if (LocalStorage.getSelectedCurrency() != null) "currency_id": LocalStorage.getSelectedCurrency()?.id, "page": page, "status": "published", "category_id": categoryId, "perPage": 6, if (sortIndex != 0 && sortIndex != null) "column": sortIndex == 1 ? "price_asc" : "price_desc", if (brands?.isNotEmpty ?? false) for (int i = 0; i < (brands?.length ?? 0); i++) 'brand_ids[$i]': brands?[i], }; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/shops/$shopId/products/paginate', queryParameters: data, ); return ApiResult.success( data: ProductsPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getProductsPopularPaginate({ String? shopId, required int page, }) async { final data = ProductRequest(shopId: shopId!, page: page); try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/shops/$shopId/products/recommended/paginate', queryParameters: data.toJsonPopular(), ); return ApiResult.success( data: ProductsPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getMostSoldProducts({ int? shopId, int? categoryId, int? brandId, }) async { final data = { if (shopId != null) 'shop_id': shopId, if (categoryId != null) 'category_id': categoryId, if (brandId != null) 'brand_id': brandId, if (LocalStorage.getSelectedCurrency() != null) 'currency_id': LocalStorage.getSelectedCurrency()?.id, 'lang': LocalStorage.getLanguage()?.locale, }; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/products/most-sold', queryParameters: data, ); return ApiResult.success( data: ProductsPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getRelatedProducts(int? brandId, int? shopId, int? categoryId, ) async { final data = { 'brand_id': brandId, 'shop_id': shopId, 'category_id': categoryId, "status": "published", 'lang': LocalStorage.getLanguage()?.locale, }; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/products/paginate', queryParameters: data, ); return ApiResult.success( data: ProductsPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getProductCalculations(int stockId, int quantity, ) async { final data = { if (LocalStorage.getSelectedCurrency() != null) 'currency_id': LocalStorage.getSelectedCurrency()?.id, 'products[0][id]': stockId, 'products[0][quantity]': quantity, }; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/products/calculate', queryParameters: data, ); return ApiResult.success( data: ProductCalculateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getAllCalculations(List<CartProductData> cartProducts, ) async { final data = { if (LocalStorage.getSelectedCurrency() != null) 'currency_id': LocalStorage.getSelectedCurrency()?.id, }; for (int i = 0; i < cartProducts.length; i++)`
*No documentation provided (generation failed).*

### `getProductsByIds(List<int> ids, ) async { final data = { if (LocalStorage.getSelectedCurrency() != null) 'currency_id': LocalStorage.getSelectedCurrency()?.id, 'lang': LocalStorage.getLanguage()?.locale, }; for (int i = 0; i < ids.length; i++)`
*No documentation provided (generation failed).*

### `addReview(String productUuid, String comment, double rating, String? imageUrl, ) async { final data = { 'rating': rating, if (comment != "") 'comment': comment, if (imageUrl != null) 'images': [imageUrl], }; debugPrint('===> add review data: $data'); try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/rest/products/review/$productUuid', data: data, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `getNewProducts({ int? shopId, int? brandId, int? categoryId, int? page, }) async { final data = { if (shopId != null) 'shop_id': shopId, if (brandId != null) 'brand_id': brandId, if (categoryId != null) 'category_id': categoryId, if (page != null) 'page': page, 'sort': 'desc', 'column': 'created_at', if (LocalStorage.getSelectedCurrency() != null) 'currency_id': LocalStorage.getSelectedCurrency()?.id, 'perPage': 14, "status": "published", 'lang': LocalStorage.getLanguage()?.locale, }; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/products/paginate', queryParameters: data, ); return ApiResult.success( data: ProductsPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getDiscountProducts({ int? shopId, int? brandId, int? categoryId, int? page, }) async { final data = { if (shopId != null) 'shop_id': shopId, if (brandId != null) 'brand_id': brandId, if (categoryId != null) 'category_id': categoryId, if (page != null) 'page': page, if (LocalStorage.getSelectedCurrency() != null) 'currency_id': LocalStorage.getSelectedCurrency()?.id, 'perPage': 14, 'lang': LocalStorage.getLanguage()?.locale, }; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/products/discount', queryParameters: data, ); return ApiResult.success( data: ProductsPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getProfitableProducts({ int? brandId, int? categoryId, int? page, }) async { final data = { if (brandId != null) 'brand_id': brandId, if (categoryId != null) 'category_id': categoryId, if (page != null) 'page': page, 'profitable': true, if (LocalStorage.getSelectedCurrency() != null) 'currency_id': LocalStorage.getSelectedCurrency()?.id, 'perPage': 14, 'lang': LocalStorage.getLanguage()?.locale, }; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/products/discount', queryParameters: data, ); return ApiResult.success( data: ProductsPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*
