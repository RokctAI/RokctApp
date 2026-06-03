# API Reference: banners_repository

Source file: `lib/customer/repository/banners_repository.dart`

## Classes

### class `BannersRepository`

## Whitelisted API Endpoints

### `getBannersPaginate({ required int page, }) async { final data = BannersRequest(page: page); try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/banners/paginate', queryParameters: data.toJson(), ); return ApiResult.success( data: BannersPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getAdsPaginate({ required int page, }) async { final data = BannersRequest(page: page, perPage: 6); try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/banners-ads', queryParameters: data.toJson(), ); return ApiResult.success( data: BannersPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getBannerById(int? bannerId) async { final data = {'lang': LocalStorage.getLanguage()?.locale, "perPage": 100}; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/banners/$bannerId', queryParameters: data, ); return ApiResult.success( data: BannerData.fromJson(response.data["data"]), ); } catch (e)`
*No documentation provided (generation failed).*

### `getAdsById(int? bannerId) async { final data = {'lang': LocalStorage.getLanguage()?.locale, "perPage": 100}; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/banners-ads/$bannerId', queryParameters: data, ); return ApiResult.success( data: BannerData.fromJson(response.data["data"]), ); } catch (e)`
*No documentation provided (generation failed).*

### `likeBanner(int? bannerId) async { try { final client = dioHttp.client(requireAuth: true); await client.post('/api/v1/rest/banners/$bannerId/liked'); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*
