# API Reference: subscription_repository

Source file: `lib/manager/infrastructure/repositories/subscription_repository.dart`

## Classes

### class `SubscriptionsRepository`

## Whitelisted API Endpoints

### `getSubscriptions({ required int page, }) async { final data = {'lang': LocalStorage.getLanguage()?.locale}; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/seller/subscriptions', queryParameters: data, ); return ApiResult.success( data: SubscriptionResponse.fromJson(response.data), ); } catch (e, s)`
*No documentation provided (generation failed).*

### `purchaseSubscription({ required int id, required int paymentId, }) async { final data = {'payment_sys_id': paymentId}; try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/dashboard/seller/subscriptions/$id/attach', data: data, ); return ApiResult.success(data: response.data['data']['id']); } catch (e)`
*No documentation provided (generation failed).*

### `createTransaction({ required int id, required int paymentId, }) async { final data = {'payment_sys_id': paymentId}; debugPrint('===> create transaction body: ${jsonEncode(data)}'); debugPrint('===> create transaction subscriptions id: $id'); try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/payments/subscription/$id/transactions', data: data, ); return ApiResult.success( data: TransactionsResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*
