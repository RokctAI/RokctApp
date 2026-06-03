# API Reference: categories_repository

Source file: `lib/customer/repository/categories_repository.dart`

## Classes

### class `CategoriesRepository`

## Whitelisted API Endpoints

### `getAllCategories({ required int page, }) async { final data = CategoryModel(page: page); try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/categories/paginate', queryParameters: data.toJson(), ); return ApiResult.success( data: CategoriesPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `searchCategories({ required String text, }) async { final data = SearchShopModel(text: text); try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/categories/search', queryParameters: data.toJson(), ); return ApiResult.success( data: CategoriesPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getCategoriesByShop({ required String shopId, }) async { final data = CategoryModel(page: 1); try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/shops/$shopId/categories', queryParameters: data.toJsonShop(), ); return ApiResult.success( data: CategoriesPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*
