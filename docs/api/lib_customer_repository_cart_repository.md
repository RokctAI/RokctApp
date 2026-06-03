# API Reference: cart_repository

Source file: `lib/customer/repository/cart_repository.dart`

## Classes

### class `CartRepository`

## Whitelisted API Endpoints

### `createCart({required CartRequest cart}) async { try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/dashboard/user/cart/open', data: cart.toJson(), ); return ApiResult.success(data: CartModel.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `insertCart({required CartRequest cart}) async { try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/dashboard/user/cart/insert-product', data: cart.toJsonInsert(), ); return ApiResult.success(data: CartModel.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `insertCartWithGroup({ required CartRequest cart, }) async { try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/rest/cart/insert-product', data: cart.toJsonInsert(), ); return ApiResult.success(data: CartModel.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `createAndCart({ required CartRequest cart, }) async { try { final client = dioHttp.client(requireAuth: true); debugPrint('==> get open Add Cart failure: ${cart.toJson()}'); final response = await client.post( '/api/v1/dashboard/user/cart', data: cart.toJson(), ); return ApiResult.success(data: CartModel.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `getCart() async { final data = { if (LocalStorage.getSelectedCurrency() != null) 'currency_id': LocalStorage.getSelectedCurrency()?.id, 'lang': LocalStorage.getLanguage()?.locale, }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/user/cart', queryParameters: data, ); return ApiResult.success(data: CartModel.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `getCartInGroup(String? cartId, String? shopId, String? cartUuid, ) async { final data = { if (LocalStorage.getSelectedCurrency() != null) 'currency_id': LocalStorage.getSelectedCurrency()?.id, 'lang': LocalStorage.getLanguage()?.locale, 'shop_id': shopId, 'user_cart_uuid': cartUuid, }; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/cart/$cartId', queryParameters: data, ); return ApiResult.success(data: CartModel.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `deleteCart({required int cartId}) async { final data = {'ids[0]': cartId}; try { final client = dioHttp.client(requireAuth: true); await client.delete( '/api/v1/dashboard/user/cart/delete', queryParameters: data, ); return ApiResult.success(data: CartModel()); } catch (e)`
*No documentation provided (generation failed).*

### `changeStatus({ required String? userUuid, required String? cartId, }) async { try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/rest/cart/status/$userUuid', data: {"cart_id": cartId}, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `deleteUser({ required int cartId, required String userId, }) async { final data = {'cart_id': cartId, "ids[0]": userId}; try { final client = dioHttp.client(requireAuth: true); await client.delete( '/api/v1/dashboard/user/cart/member/delete', queryParameters: data, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `startGroupOrder({required int cartId}) async { try { final client = dioHttp.client(requireAuth: true); await client.post('/api/v1/dashboard/user/cart/set-group/$cartId'); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `removeProductCart({ required int cartDetailId, List<int>? listOfId, }) async { final data = { for (int i = 0; i < (listOfId?.length ?? 0); i++) 'ids[${i + 1}]': listOfId?[i], 'ids[0]': cartDetailId, }; try { final client = dioHttp.client(requireAuth: true); await client.delete( '/api/v1/dashboard/user/cart/product/delete', queryParameters: data, ); return ApiResult.success(data: CartModel()); } catch (e)`
*No documentation provided (generation failed).*
