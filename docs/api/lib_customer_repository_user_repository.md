# API Reference: user_repository

Source file: `lib/customer/repository/user_repository.dart`

## Classes

### class `UserRepository`

## Whitelisted API Endpoints

### `getProfileDetails() async { try { final data = { if (LocalStorage.getSelectedCurrency() != null) 'currency_id': LocalStorage.getSelectedCurrency()?.id, "lang": LocalStorage.getLanguage()?.locale ?? "en", }; final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/user/profile/show', queryParameters: data, ); return ApiResult.success(data: ProfileResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `getReferralDetails() async { try { final data = { if (LocalStorage.getSelectedCurrency() != null) 'currency_id': LocalStorage.getSelectedCurrency()?.id, "lang": LocalStorage.getLanguage()?.locale ?? "en", }; final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/rest/referral', queryParameters: data, ); return ApiResult.success( data: ReferralModel.fromJson(response.data["data"]), ); } catch (e)`
*No documentation provided (generation failed).*

### `editProfile({ required EditProfile? user, }) async { final data = user?.toJson(); debugPrint('===> update general info data ${jsonEncode(data)}'); try { final client = dioHttp.client(requireAuth: true); final response = await client.put( '/api/v1/dashboard/user/profile/update', data: data, ); return ApiResult.success(data: ProfileResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `updateProfileImage({ required String firstName, required String imageUrl, }) async { final data = { 'firstname': firstName, 'images': [imageUrl], }; try { final client = dioHttp.client(requireAuth: true); final response = await client.put( '/api/v1/dashboard/user/profile/update', data: data, ); return ApiResult.success(data: ProfileResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `updatePassword({ required String password, required String passwordConfirmation, }) async { final data = { 'password': password, 'password_confirmation': passwordConfirmation, }; try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/dashboard/user/profile/password/update', data: data, ); return ApiResult.success(data: ProfileResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `getWalletHistories(int page, ) async { final data = { 'page': page, if (LocalStorage.getSelectedCurrency() != null) 'currency_id': LocalStorage.getSelectedCurrency()?.id, "lang": LocalStorage.getLanguage()?.locale ?? "en", }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/user/wallet/histories', queryParameters: data, ); return ApiResult.success( data: WalletHistoriesResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `updateFirebaseToken(String? token) async { final data = {if (token != null) 'firebase_token': token}; try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/dashboard/user/profile/firebase/token/update', data: data, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `deleteAccount() async { try { final client = dioHttp.client(requireAuth: true); await client.delete('/api/v1/dashboard/user/profile/delete'); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `logoutAccount({required String fcm}) async { try { final client = dioHttp.client(requireAuth: true); await client.post('/api/v1/auth/logout', data: {"firebase_token": fcm}); LocalStorage.logout(); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `saveLocation({required AddressNewModel? address}) async { try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/dashboard/user/addresses', data: address?.toJson(), ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `updateLocation({ required AddressNewModel? address, required int? addressId, }) async { try { final client = dioHttp.client(requireAuth: true); await client.put( '/api/v1/dashboard/user/addresses/$addressId', data: address?.toJson(), ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `setActiveAddress({required int id}) async { try { final client = dioHttp.client(requireAuth: true); await client.post('/api/v1/dashboard/user/address/set-active/$id'); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `deleteAddress({required int id}) async { try { final client = dioHttp.client(requireAuth: true); await client.delete('/api/v1/dashboard/user/addresses/delete?ids[0]=$id'); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `getCareers() async { final data = { "active": 1, "page": 1, "lang": LocalStorage.getLanguage()?.locale ?? "en", }; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/careers/paginate', queryParameters: data, ); return ApiResult.success( data: CareerDataResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getCareerData(int id) async { final data = {"lang": LocalStorage.getLanguage()?.locale ?? "en"}; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/careers/$id', queryParameters: data, ); final raw = response.data["data"]; return ApiResult.success(data: CareerData.fromJson(raw)); } catch (e)`
*No documentation provided (generation failed).*

### `getBlogs()`
*No documentation provided (generation failed).*

### `getSingleBlog(String uuid)`
*No documentation provided (generation failed).*

### `getAbout({required int page}) async { final data = { "lang": LocalStorage.getLanguage()?.locale ?? "en", "page": page, "type": "all_about", "prePage": 10, }; try { final client = dioHttp.client(requireAuth: false); final res = await client.get( '/api/v1/rest/pages/paginate', queryParameters: data, ); return ApiResult.success(data: PagesResponse.fromJson(res.data)); } catch (e)`
*No documentation provided (generation failed).*
