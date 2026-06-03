# API Reference: shops_repository

Source file: `lib/customer/repository/shops_repository.dart`

## Classes

### class `ShopsRepository`

## Whitelisted API Endpoints

### `searchShops({ required String text, int? categoryId, }) async { final data = SearchShopModel(text: text, categoryId: categoryId); try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/shops/search', queryParameters: data.toJson(), ); return ApiResult.success( data: ShopsPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getNearbyShops(double latitude, double longitude, ) async { final data = {'clientLocation': '$latitude,$longitude'}; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/shops/nearby', queryParameters: data, ); return ApiResult.success( data: ShopsPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getAllShops(int page, { int? categoryId, FilterModel? filterModel, required bool isOpen, bool? verify, }) async { final data = ShopRequest( page: page, categoryId: categoryId, price: filterModel?.price, rating: filterModel?.rating, freeDelivery: filterModel?.isFreeDelivery, orderBy: filterModel?.sort, onlyOpen: isOpen, verify: verify, deals: filterModel?.isDeal, take: filterModel?.offer, ); try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/shops/paginate', queryParameters: data.toJson(), ); return ApiResult.success( data: ShopsPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getShopBranch({required int uuid}) async { try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/branches?lang=en&shop_id=$uuid&page=1&perPage=100', ); return ApiResult.success(data: BranchResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `getSingleShop({ required String uuid, }) async { final data = OnlyShopRequest(); try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/shops/$uuid', queryParameters: data.toJson(), ); return ApiResult.success( data: SingleShopResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `joinOrder({ required String shopId, required String name, required String cartId, }) async { final data = {"shop_id": shopId, "name": name, "cart_id": cartId}; try { final client = dioHttp.client(requireAuth: false); final response = await client.post('/api/v1/rest/cart/open', data: data); return ApiResult.success(data: response.data["data"]["uuid"]); } catch (e)`
*No documentation provided (generation failed).*

### `getShopFilter({ int? categoryId, required int page, int? subCategoryId, }) async { final data = { 'category_id': subCategoryId ?? categoryId, 'perPage': 5, "open": 1, "page": page, 'lang': LocalStorage.getLanguage()?.locale, "address": { "latitude": LocalStorage.getAddressSelected()?.location?.latitude ?? AppConstants.demoLatitude, "longitude": LocalStorage.getAddressSelected()?.location?.longitude ?? AppConstants.demoLongitude, }, }; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/shops/paginate', queryParameters: data, ); return ApiResult.success( data: ShopsPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getPickupShops() async { final data = { 'delivery': 'pickup', 'perPage': 100, 'lang': LocalStorage.getLanguage()?.locale, }; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/shops/paginate', queryParameters: data, ); return ApiResult.success( data: ShopsPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getShopsByIds(List<int> shopIds, ) async { final data = <String, Dyn>{'lang': LocalStorage.getLanguage()?.locale}; for (int i = 0; i < shopIds.length; i++)`
*No documentation provided (generation failed).*

### `createShop({ required double tax, required List<String> documents, required double deliveryTo, required double deliveryFrom, required String deliveryType, required String phone, required String name, required num category, required String description, required double startPrice, required double perKm, required AddressNewModel? address, String? logoImage, String? backgroundImage, }) async { final data = { "price_per_km": perKm, 'tax': tax, 'documents': documents, 'delivery_time_type': deliveryType, 'location': LocationData( latitude: address?.location?.first, longitude: address?.location?.last, ).toJson(), 'phone': phone, 'delivery_time_from': deliveryFrom, 'delivery_time_to': deliveryTo, 'title': {LocalStorage.getLanguage()?.locale ?? "": name}, 'description': {LocalStorage.getLanguage()?.locale ?? "": description}, 'price': startPrice, 'address': { LocalStorage.getLanguage()?.locale ?? "": "${address?.address?.address}", }, if (logoImage != null) 'images': [logoImage, backgroundImage], }; try { final client = dioHttp.client(requireAuth: true); await client.post('/api/v1/dashboard/user/shops', data: data); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `getShopsRecommend(int page) async { final data = ShopRequest(page: page, onlyOpen: true); try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/shops/recommended', queryParameters: data.toJson(), ); return ApiResult.success( data: ShopsPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getStory(int page) async { final data = StoryRequest(page: page); try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/stories/paginate', queryParameters: data.toJson(), ); return ApiResult.success(data: storyModelFromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `getTags(int categoryId) async { try { final client = dioHttp.client(requireAuth: false); final data = <String, Dyn>{ 'lang': LocalStorage.getLanguage()?.locale ?? "en", 'category_id': categoryId, }; final response = await client.get( '/api/v1/rest/shops-takes', queryParameters: data, ); return ApiResult.success(data: TagResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `checkDriverZone(LatLng location, { int? shopId, }) async { try { final client = dioHttp.client(requireAuth: false); final data = <String, Dyn>{ 'address[latitude]': location.latitude, 'address[longitude]': location.longitude, }; Dyn response; if (shopId == null)`
*No documentation provided (generation failed).*

### `getSuggestPrice() async { try { final client = dioHttp.client(requireAuth: false); final data = { if (LocalStorage.getSelectedCurrency() != null) "currency_id": LocalStorage.getSelectedCurrency()?.id, }; final response = await client.get( '/api/v1/rest/products-avg-prices', queryParameters: data, ); return ApiResult.success(data: PriceModel.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*
