# API Reference: payment_repository

Source file: `lib/manager/infrastructure/repositories/payment_repository.dart`

## Classes

### class `PaymentRepository`

## Whitelisted API Endpoints

### `getPayments() async { try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/rest/payments', queryParameters: {"lang": LocalStorage.getLanguage()?.locale ?? 'en'}, ); return ApiResult.success(data: PaymentsResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `getNonExistPayments() async { try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/seller/shop-payments/shop-non-exist', queryParameters: {"lang": LocalStorage.getLanguage()?.locale ?? 'en'}, ); return ApiResult.success( data: NonExistPaymentResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `paymentWalletWebView({ required String name, required num price, }) async { try { final data = { 'wallet_id': LocalStorage.getUser()?.wallet?.uuid ?? 0, 'total_price': price, "currency_id": LocalStorage.getSelectedCurrency()?.id, }; final client = dioHttp.client(requireAuth: true); final res = await client.post( '/api/v1/dashboard/user/$name-process', data: data, ); return ApiResult.success(data: res.data["data"]["data"]["url"] ?? ""); } catch (e)`
*No documentation provided (generation failed).*

### `paymentMaksekeskusView({ num? price, }) async { try { final data = { 'wallet_id': LocalStorage.getUser()?.wallet?.uuid, 'total_price': price ?? 0, "currency_id": LocalStorage.getSelectedCurrency()?.id, }; debugPrint('==> payment maksekeskus request: $data'); final client = dioHttp.client(requireAuth: true); final res = await client.post( '/api/v1/dashboard/user/maksekeskus-process', data: data, ); return ApiResult.success( data: MaksekeskusResponse.fromJson(res.data["data"]), ); } catch (e)`
*No documentation provided (generation failed).*

### `paymentSubscriptionWebView({ required String name, required int subscriptionId, }) async { try { final data = { 'subscription_id': subscriptionId, "currency_id": LocalStorage.getSelectedCurrency()?.id, }; final client = dioHttp.client(requireAuth: true); final res = await client.post( '/api/v1/dashboard/user/$name-process', data: data, ); return ApiResult.success(data: res.data["data"]["data"]["url"] ?? ""); } catch (e)`
*No documentation provided (generation failed).*

### `sendWallet({ required String uuid, required num price, }) async { try { final data = { 'uuid': uuid, 'price': price, "currency_id": LocalStorage.getSelectedCurrency()?.id, }; final client = dioHttp.client(requireAuth: true); await client.post('/api/v1/dashboard/user/wallet/send', data: data); return const ApiResult.success(data: true); } catch (e)`
*No documentation provided (generation failed).*
