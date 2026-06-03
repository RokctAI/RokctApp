# API Reference: user_repository_impl

Source file: `lib/driver/infrastructure/repositories/user_repository_impl.dart`

## Classes

### class `UserRepositoryImpl`

## Whitelisted API Endpoints

### `getDriverDetails() async { try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/deliveryman/settings', ); return ApiResult.success(data: DeliveryResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `updateGeneralInfo({ required String firstName, String? lastName, String? phone, String? email, String? password, String? confirmPassword, }) async { final data = { 'firstname': firstName, if (lastName != null) 'lastname': lastName, if (phone != null) 'phone': phone.replaceAll("+", ""), if (email != null) 'email': email, if (password != null) 'password': password, if (confirmPassword != null) 'password_confirmation': confirmPassword, }; debugPrint('===> update general info data ${jsonEncode(data)}'); try { final client = dioHttp.client(requireAuth: true); final response = await client.put( '/api/v1/dashboard/user/profile/update', data: data, ); return ApiResult.success(data: ProfileResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `getProfileDetails() async { try { final client = dioHttp.client(requireAuth: true); final response = await client.get('/api/v1/dashboard/user/profile/show'); return ApiResult.success(data: ProfileResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `editProfile({ required EditProfile? user, }) async { final data = user?.toJson(); debugPrint('===> update general info data ${jsonEncode(data)}'); try { final client = dioHttp.client(requireAuth: true); final response = await client.put( '/api/v1/dashboard/user/profile/update', data: data, ); return ApiResult.success(data: ProfileResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `updateProfileImage({ String? firstName, String? imageUrl, }) async { final data = { 'firstname': firstName, 'images': [imageUrl], }; debugPrint('===> update profile image data ${jsonEncode(data)}'); try { final client = dioHttp.client(requireAuth: true); final response = await client.put( '/api/v1/dashboard/user/profile/update', data: data, ); return ApiResult.success(data: ProfileResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `updatePassword({ required String password, required String passwordConfirmation, }) async { final data = { 'password': password, 'password_confirmation': passwordConfirmation, }; try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/dashboard/user/profile/password/update', data: data, ); return ApiResult.success(data: ProfileResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `updateFirebaseToken(String? token) async { final data = {if (token != null) 'firebase_token': token}; try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/dashboard/user/profile/firebase/token/update', data: data, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `editCarInfo({ required String type, required String brand, required String model, required String number, required String color, required String height, required String weight, required String length, required String width, String? imageUrl, }) async { final data = { 'type_of_technique': type, 'brand': brand, 'model': model, 'number': number, 'color': color, 'height': int.tryParse(height) ?? 0, 'width': int.tryParse(width) ?? 0, 'kg': int.tryParse(weight) ?? 0, 'length': int.tryParse(length) ?? 0, "online": (LocalStorage.getUser()?.active ?? false) ? 1 : 0, if (imageUrl != null) 'images[0]': imageUrl, }; debugPrint('===> update car info data ${jsonEncode(data)}'); try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/dashboard/deliveryman/settings', data: data, ); return ApiResult.success(data: DeliveryResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `createCarInfo({ required String type, required String brand, required String model, required String number, required String color, required String height, required String weight, required String length, required String width, String? imageUrl, }) async { final data = { "data": { "type_of_technique": type, "brand": brand, "model": model, "number": number, "color": color, 'height': int.tryParse(height) ?? 0, 'width': int.tryParse(width) ?? 0, 'kg': int.tryParse(weight) ?? 0, 'length': int.tryParse(length) ?? 0, "online": (LocalStorage.getUser()?.active ?? false) ? 1 : 0, if (imageUrl != null) 'images[0]': imageUrl, }, }; debugPrint('===> create car info data ${jsonEncode(data)}'); try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/dashboard/user/request-models', data: data, ); return ApiResult.success( data: DeliveryResponse.fromJson(response.data['data']), ); } catch (e, s)`
*No documentation provided (generation failed).*

### `getStatistics({ required DateTime startTime, required DateTime endTime, }) async { try { final data = { "date_from": endTime.toString().substring( 0, endTime.toString().indexOf(" "), ), "date_to": startTime.toString().substring( 0, startTime.toString().indexOf(" "), ), "type": "day", }; final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/deliveryman/order/report', queryParameters: data, ); return ApiResult.success( data: StatisticsIncomeResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getStatisticsOrder({ DateTime? startTime, DateTime? endTime, int? page, int? perPage, }) async { try { final data = { if (endTime != null) "date_from": endTime.toString().substring( 0, endTime.toString().indexOf(" "), ), if (startTime != null) "date_to": startTime.toString().substring( 0, startTime.toString().indexOf(" "), ), "page": page, "perPage": perPage ?? 10, }; final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/seller/orders/report/paginate', queryParameters: data, ); return ApiResult.success( data: StatisticsOrderResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `setOnline() async { try { final client = dioHttp.client(requireAuth: true); await client.post('/api/v1/dashboard/deliveryman/settings/online'); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `getRequestModel() async { try { final client = dioHttp.client(requireAuth: true); final res = await client.get('/api/v1/dashboard/user/request-models'); return ApiResult.success(data: RequestModelResponse.fromJson(res.data)); } catch (e)`
*No documentation provided (generation failed).*

### `getDriverStatistics() async { try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/deliveryman/statistics/count', ); return ApiResult.success( data: StatisticsResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `setCurrentLocation(LatLng location) async { try { final client = dioHttp.client(requireAuth: true); final res = await client.post( '/api/v1/dashboard/deliveryman/settings/location', data: { "location": LocalLocationData( latitude: location.latitude, longitude: location.longitude, ).toJson(), }, ); LocalStorage.setDeliveryInfo(DeliveryResponse.fromJson(res.data)); return const ApiResult.success(data: null); } catch (e, s)`
*No documentation provided (generation failed).*

### `deleteAccount() async { try { final client = dioHttp.client(requireAuth: true); await client.delete('/api/v1/dashboard/user/profile/delete'); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `updateDeliveryZones({ required List<LatLng> points, }) async { List<Map<String, Dyn>> tapped = []; for (final point in points)`
*No documentation provided (generation failed).*

### `getDeliveryZone() async { final data = { 'lang': LocalStorage.getLanguage()?.locale, 'currency_id': LocalStorage.getSelectedCurrency()?.id, 'perPage': 1, }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/deliveryman/delivery-zones', queryParameters: data, ); return ApiResult.success( data: DeliveryZonePaginate.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*
