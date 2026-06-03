# API Reference: payments_repository

Source file: `lib/customer/repository/payments_repository.dart`

## Classes

### class `PaymentsRepository`

## Whitelisted API Endpoints

### `getPayments() async { final data = {'lang': LocalStorage.getLanguage()?.locale}; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/payments', queryParameters: data, ); return ApiResult.success(data: PaymentsResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `createTransaction({ required int orderId, required int paymentId, }) async { final data = {'payment_sys_id': paymentId}; try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/payments/order/$orderId/transactions', data: data, ); return ApiResult.success( data: TransactionsResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*
