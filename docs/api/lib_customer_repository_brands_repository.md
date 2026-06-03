# API Reference: brands_repository

Source file: `lib/customer/repository/brands_repository.dart`

## Classes

### class `BrandsRepository`

## Whitelisted API Endpoints

### `getBrandsPaginate(int page) async { final data = {'page': page, 'perPage': 18}; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/brands/paginate', queryParameters: data, ); return ApiResult.success( data: BrandsPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getSingleBrand(int id) async { try { final client = dioHttp.client(requireAuth: false); final response = await client.get('/api/v1/rest/brands/$id'); return ApiResult.success( data: SingleBrandResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getAllBrands({ required int categoryId, }) async { final data = { 'perPage': 100, "category_id": categoryId, 'lang': LocalStorage.getLanguage()?.locale, }; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/brands/paginate', queryParameters: data, ); return ApiResult.success( data: BrandsPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `searchBrands(String query) async { final data = {'search': query, 'perPage': 5}; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/brands/paginate', queryParameters: data, ); return ApiResult.success( data: BrandsPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*
