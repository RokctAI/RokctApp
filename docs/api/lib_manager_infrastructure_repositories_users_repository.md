# API Reference: users_repository

Source file: `lib/manager/infrastructure/repositories/users_repository.dart`

## Classes

### class `UsersRepository`

## Whitelisted API Endpoints

### `createUser({ required String firstname, required String lastname, required String phone, required String email, }) async { final data = { 'firstname': firstname, 'lastname': lastname, 'email': email, 'phone': phone.replaceAll("+", ""), 'role': 'user', }; debugPrint('===> create user ${jsonEncode(data)}'); try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/dashboard/seller/users', data: data, ); return ApiResult.success(data: ProfileResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `getStatistics({ required DateTime startTime, required DateTime endTime, }) async { try { final data = { "date_from": endTime.toString().substring( 0, endTime.toString().indexOf(" "), ), "date_to": startTime.toString().substring( 0, startTime.toString().indexOf(" "), ), "type": "day", }; final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/seller/order/report', queryParameters: data, ); return ApiResult.success( data: StatisticsResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getStatisticsOrder({ DateTime? startTime, DateTime? endTime, int? page, int? perPage, }) async { try { final data = { if (endTime != null) "date_from": endTime.toString().substring( 0, endTime.toString().indexOf(" "), ), if (startTime != null) "date_to": startTime.toString().substring( 0, startTime.toString().indexOf(" "), ), "page": page, "perPage": perPage ?? 10, }; final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/seller/orders/report/paginate', queryParameters: data, ); return ApiResult.success( data: StatisticsOrderResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `updateDeliveryZones({ required List<LatLng> points, }) async { List<Map<String, Dyn>> tapped = []; for (final point in points)`
*No documentation provided (generation failed).*

### `getDeliveryZone() async { final data = { 'lang': LocalStorage.getLanguage()?.locale, 'currency_id': LocalStorage.getSelectedCurrency()?.id, 'perPage': 1, }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/seller/delivery-zones', queryParameters: data, ); return ApiResult.success( data: DeliveryZonePaginate.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `updateShopWorkingDays({ required List<ShopWorkingDays> workingDays, String? uuid, }) async { List<Map<String, Dyn>> days = []; for (final workingDay in workingDays)`
*No documentation provided (generation failed).*

### `updateShop({ String? tax, num? percentage, String? phone, String? type, num? pricePerKm, String? minAmount, num? price, String? backImg, String? orderPayment, String? logoImg, List<CategoryData>? categories, DeliveryTime? deliveryTime, Translation? translation, List<ShopTag>? tags, }) async { List<int> categoryIds = []; List<int> tagIds = []; if (categories != null && categories.isNotEmpty)`
*No documentation provided (generation failed).*

### `searchUsers({ String? query, int? page, }) async { final data = { if (query != null) 'search': query, 'perPage': 14, if (page != null) 'page': page, 'sort': 'desc', 'column': 'created_at', }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/seller/users/paginate', queryParameters: data, ); return ApiResult.success( data: UsersPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getMyShop() async { final data = { 'lang': LocalStorage.getLanguage()?.locale, 'currency_id': LocalStorage.getSelectedCurrency()?.id, }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/seller/shops', queryParameters: data, ); return ApiResult.success( data: SingleShopResponse.fromJson(response.data), ); } catch (e, s)`
*No documentation provided (generation failed).*

### `setOnlineOffline() async { try { final client = dioHttp.client(requireAuth: true); await client.post('/api/v1/dashboard/seller/shops/working/status'); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `getProfileDetails() async { try { final client = dioHttp.client(requireAuth: true); final response = await client.get('/api/v1/dashboard/user/profile/show'); return ApiResult.success(data: ProfileResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `editProfile({ required EditProfile? user, }) async { final data = user?.toJson(); debugPrint('===> update general info data ${jsonEncode(data)}'); try { final client = dioHttp.client(requireAuth: true); final response = await client.put( '/api/v1/dashboard/user/profile/update', data: data, ); return ApiResult.success(data: ProfileResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `updateProfileImage({ required String firstName, required String imageUrl, }) async { final data = { 'firstname': firstName, 'images': [imageUrl], }; try { final client = dioHttp.client(requireAuth: true); final response = await client.put( '/api/v1/dashboard/user/profile/update', data: data, ); return ApiResult.success(data: ProfileResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `updatePassword({ required String password, required String passwordConfirmation, }) async { final data = { 'password': password, 'password_confirmation': passwordConfirmation, }; try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/dashboard/user/profile/password/update', data: data, ); return ApiResult.success(data: ProfileResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `updateFirebaseToken(String? token) async { final data = {if (token != null) 'firebase_token': token}; debugPrint('===> update firebase token ${jsonEncode(data)}'); try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/dashboard/user/profile/firebase/token/update', data: data, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `deleteAccount() async { try { final client = dioHttp.client(requireAuth: true); await client.delete('/api/v1/dashboard/user/profile/delete'); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*
