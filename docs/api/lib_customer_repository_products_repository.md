# API Reference: products_repository

Source file: `lib/customer/repository/products_repository.dart`

## Classes

### class `ProductsRepository`

## Whitelisted API Endpoints

### `searchProducts({ required String text, int? page, }) async { final params = { 'search': text, if (page != null) 'page': page, 'limit_page_length': 10, }; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/method/paas.api.product.product.search_products', queryParameters: params, ); final responseData = ProductsPaginateResponse.fromJson(response.data); if (responseData.data != null)`
*No documentation provided (generation failed).*

### `getProductDetails(String uuid, ) async { try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/method/paas.api.product.product.get_product_by_uuid', queryParameters: {'uuid': uuid}, ); final responseData = SingleProductResponse.fromJson(response.data); if (responseData.data != null)`
*No documentation provided (generation failed).*

### `getProductsPaginate({ String? shopId, String? categoryId, String? brandId, int? page, String? orderBy, }) async { final params = { 'limit_page_length': 10, if (page != null) 'page': page, if (shopId != null) 'shop_id': shopId, if (categoryId != null) 'category_id': categoryId, if (brandId != null) 'brand_id': brandId, if (orderBy != null) 'order_by': orderBy, }; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/method/paas.api.product.product.get_products', queryParameters: params, ); final responseData = ProductsPaginateResponse.fromJson(response.data); if (responseData.data != null)`
*No documentation provided (generation failed).*

### `getAllProducts({ required String shopId, }) async { try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/method/paas.api.product.product.get_products', queryParameters: {'shop_id': shopId, 'limit_page_length': 100}, ); final responseData = AllProductsResponse.fromJson(response.data); if (responseData.data != null && responseData.data!.recommended != null)`
*No documentation provided (generation failed).*

### `getProductsPopularPaginate({ String? shopId, required int page, }) async { return getProductsPaginate( shopId: shopId, page: page, orderBy: 'rating', ); } @override Future<ApiResult<ProductsPaginateResponse>> getProductsByCategoryPaginate({ String? shopId, required int page, required String categoryId, }) async { return getProductsPaginate( shopId: shopId, categoryId: categoryId, page: page, ); } @override Future<ApiResult<ProductsPaginateResponse>> getProductsShopByCategoryPaginate({ String? shopId, List<String>? brands, int? sortIndex, required int page, required String categoryId, }) async { return getProductsPaginate( shopId: shopId, categoryId: categoryId, page: page, ); } @override Future<ApiResult<ProductsPaginateResponse>> getMostSoldProducts({ String? shopId, String? categoryId, String? brandId, }) async { final params = { 'limit_page_length': 14, if (shopId != null) 'shop_id': shopId, if (categoryId != null) 'category_id': categoryId, if (brandId != null) 'brand_id': brandId, }; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/method/paas.api.product.product.most_sold_products', queryParameters: params, ); final responseData = ProductsPaginateResponse.fromJson(response.data); if (responseData.data != null)`
*No documentation provided (generation failed).*

### `getRelatedProducts(String? brandId, String? shopId, String? categoryId, ) async { return getProductsPaginate( shopId: shopId, brandId: brandId, categoryId: categoryId, page: 1, ); } @override Future<ApiResult<ProductCalculateResponse>> getProductCalculations( String stockId, int quantity, ) async { return getAllCalculations([ CartProductData( selectedStock: Stocks(id: stockId), quantity: quantity, ), ]); } @override Future<ApiResult<ProductCalculateResponse>> getAllCalculations( List<CartProductData> cartProducts, ) async { final products = cartProducts .map((p) => {'product_id': p.selectedStock?.id, 'quantity': p.quantity}) .toList(); try { final client = dioHttp.client(requireAuth: false); final response = await client.post( '/api/v1/method/paas.api.product.product.order_products_calculate', data: {'products': products}, ); return ApiResult.success( data: ProductCalculateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getProductsByIds(List<String> ids, ) async { try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/method/paas.api.product.product.get_products_by_ids', queryParameters: {'ids': ids}, ); final responseData = ProductsPaginateResponse.fromJson(response.data); if (responseData.data != null)`
*No documentation provided (generation failed).*

### `addReview(String productUuid, String comment, double rating, String? imageUrl, ) async { final data = { 'uuid': productUuid, 'rating': rating, if (comment.isNotEmpty) 'comment': comment, }; try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/method/paas.api.product.product.add_product_review', data: data, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `getNewProducts({ String? shopId, String? brandId, String? categoryId, int? page, }) async { return getProductsPaginate( shopId: shopId, brandId: brandId, categoryId: categoryId, page: page, orderBy: 'created_at', ); } @override Future<ApiResult<ProductsPaginateResponse>> getDiscountProducts({ String? shopId, String? brandId, String? categoryId, int? page, }) async { final params = { 'limit_start': ((page ?? 1) - 1) * 14, 'limit_page_length': 14, if (shopId != null) 'shop_id': shopId, if (categoryId != null) 'category_id': categoryId, if (brandId != null) 'brand_id': brandId, }; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/method/paas.api.product.product.get_discounted_products', queryParameters: params, ); final responseData = ProductsPaginateResponse.fromJson(response.data); if (responseData.data != null)`
*No documentation provided (generation failed).*
