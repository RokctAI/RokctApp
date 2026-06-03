# API Reference: orders_repository

Source file: `lib/manager/infrastructure/repositories/orders_repository.dart`

## Classes

### class `OrdersRepository`

## Whitelisted API Endpoints

### `createTransaction({ required int orderId, required int paymentId, }) async { final data = {'payment_sys_id': paymentId}; debugPrint('===> create transaction body: ${jsonEncode(data)}'); debugPrint('===> create transaction order id: $orderId'); try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/payments/order/$orderId/transactions', data: data, ); return ApiResult.success( data: TransactionsResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getPayments() async { try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/seller/shop-payments', ); return ApiResult.success(data: PaymentsResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `createOrder({ required String deliveryType, required List<Stock> stocks, required String deliveryTime, required String address, UserData? user, LocationData? location, String? entrance, int? tableId, String? floor, String? house, }) async { List<Map<String, Dyn>> products = []; for (final stock in stocks)`
*No documentation provided (generation failed).*

### `updateOrderStatus({ required OrderStatus status, int? orderId, }) async { String? statusText; switch (status)`
*No documentation provided (generation failed).*

### `getOrderDetails({int? orderId}) async { try { final client = dioHttp.client(requireAuth: true); final data = {'lang': LocalStorage.getLanguage()?.locale}; final response = await client.get( '/api/v1/dashboard/seller/orders/$orderId', queryParameters: data, ); return ApiResult.success( data: SingleOrderResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getOrders({ OrderStatus? status, int? page, String? from, String? to, }) async { String? statusText; switch (status)`
*No documentation provided (generation failed).*

### `getHistoryOrders({ int? page, String? from, String? to, String? status, }) async { final data = { if (page != null) 'page': page, 'statuses[0]': status, if (from != null) 'date_from': from, if (to != null) 'date_to': to, 'perPage': 10, 'lang': LocalStorage.getLanguage()?.locale, }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/seller/orders/paginate', queryParameters: data, ); return ApiResult.success( data: OrdersPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getCalculate({ required List<Stock> stocks, required String type, required LocationData? location, }) async { final data = { 'currency_id': LocalStorage.getSelectedCurrency()?.id, 'shop_id': LocalStorage.getShop()?.id, for (int i = 0; i < stocks.length; i++) 'products[$i][stock_id]': '${stocks[i].id}', for (int i = 0; i < stocks.length; i++) 'products[$i][quantity]': '${stocks[i].cartCount}', 'type': type, if (location != null) 'address[latitude]': location.latitude, if (location != null) 'address[longitude]': location.longitude, }; for (int i = 0; i < (stocks.length); i++)`
*No documentation provided (generation failed).*
