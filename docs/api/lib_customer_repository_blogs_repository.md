# API Reference: blogs_repository

Source file: `lib/customer/repository/blogs_repository.dart`

## Classes

### class `BlogsRepository`

## Whitelisted API Endpoints

### `getBlogs(int page, String type, ) async { final data = { 'perPage': 15, 'page': page, 'type': type, 'lang': LocalStorage.getLanguage()?.locale, }; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/blogs/paginate', queryParameters: data, ); return ApiResult.success( data: BlogsPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getBlogDetails(String uuid) async { final data = {'lang': LocalStorage.getLanguage()?.locale}; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/blogs/$uuid', queryParameters: data, ); return ApiResult.success( data: BlogDetailsResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*
