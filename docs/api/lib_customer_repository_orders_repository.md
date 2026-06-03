# API Reference: orders_repository

Source file: `lib/customer/repository/orders_repository.dart`

## Classes

### class `OrdersRepository`

## Whitelisted API Endpoints

### `createOrder(OrderBodyData orderBody, ) async { try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/dashboard/user/orders', data: orderBody.toJson(), ); return ApiResult.success(data: OrderActiveModel.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `createAutoOrder(String from, String to, int orderId) async { try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/dashboard/user/orders/$orderId/repeat', data: {"from": from, "to": to}, ); return const ApiResult.success(data: true); } catch (e)`
*No documentation provided (generation failed).*

### `deleteAutoOrder(int orderId) async { try { final client = dioHttp.client(requireAuth: true); await client.delete( '/api/v1/dashboard/user/orders/$orderId/delete-repeat', ); return const ApiResult.success(data: true); } catch (e)`
*No documentation provided (generation failed).*

### `getCompletedOrders(int page) async { final data = { if (LocalStorage.getSelectedCurrency() != null) 'currency_id': LocalStorage.getSelectedCurrency()?.id, 'lang': LocalStorage.getLanguage()?.locale, 'page': page, 'status': 'completed', }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/user/orders/paginate', queryParameters: data, ); return ApiResult.success( data: OrderPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getActiveOrders(int page) async { final data = { if (LocalStorage.getSelectedCurrency() != null) 'currency_id': LocalStorage.getSelectedCurrency()?.id, 'lang': LocalStorage.getLanguage()?.locale, 'page': page, 'statuses[0]': "new", "statuses[1]": "accepted", "statuses[2]": "cooking", "statuses[3]": "ready", "statuses[4]": "on_a_way", "order_statuses": true, "perPage": 10, }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/user/orders/paginate', queryParameters: data, ); return ApiResult.success( data: OrderPaginateResponse.fromJson(response.data), ); } catch (e, s)`
*No documentation provided (generation failed).*

### `getHistoryOrders(int page) async { final data = { if (LocalStorage.getSelectedCurrency() != null) 'currency_id': LocalStorage.getSelectedCurrency()?.id, 'lang': LocalStorage.getLanguage()?.locale, 'statuses[0]': "delivered", "statuses[1]": "canceled", "order_statuses": true, "perPage": 10, "page": page, }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/user/orders/paginate', queryParameters: data, ); return ApiResult.success( data: OrderPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getSingleOrder(num orderId) async { final data = { if (LocalStorage.getSelectedCurrency() != null) 'currency_id': LocalStorage.getSelectedCurrency()?.id, 'lang': LocalStorage.getLanguage()?.locale, }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/user/orders/$orderId', queryParameters: data, ); return ApiResult.success(data: OrderActiveModel.fromJson(response.data)); } catch (e, s)`
*No documentation provided (generation failed).*

### `addReview(num orderId, { required double rating, required String comment, }) async { final data = {'rating': rating, if (comment != "") 'comment': comment}; try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/dashboard/user/orders/review/$orderId', data: data, ); await client.post( '/api/v1/dashboard/user/orders/deliveryman-review/$orderId', data: data, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `process(OrderBodyData orderBody, String name, ) async { try { debugPrint( '==> order process request: ${jsonEncode(orderBody.toJson(paymentTag: name))}', ); final client = dioHttp.client(requireAuth: true); var res = await client.get( '/api/v1/dashboard/user/order-$name-process', data: orderBody.toJson(paymentTag: name), ); if (name == "pay-fast")`
*No documentation provided (generation failed).*

### `tipProcess(int? orderId, String paymentName, int? paymentId, num? tips, ) async { try { final client = dioHttp.client(requireAuth: true); if (paymentName.toLowerCase() == 'wallet')`
*No documentation provided (generation failed).*

### `checkCoupon({ required String coupon, required int shopId, }) async { final data = {'coupon': coupon, 'shop_id': shopId}; try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/rest/coupons/check', data: data, ); return ApiResult.success(data: CouponResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `checkCashback({ required double amount, required int shopId, }) async { final data = {'amount': amount, "shop_id": shopId}; try { final client = dioHttp.client(requireAuth: false); final response = await client.post( '/api/v1/rest/cashback/check', data: data, ); return ApiResult.success(data: CashbackResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `getCalculate({ required int cartId, required double lat, required double long, required DeliveryTypeEnum type, String? coupon, }) async { final data = { 'address[latitude]': lat, 'address[longitude]': long, if (LocalStorage.getSelectedCurrency() != null) 'currency_id': LocalStorage.getSelectedCurrency()?.id, "type": type == DeliveryTypeEnum.delivery ? "delivery" : "pickup", "coupon": coupon, }; try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/dashboard/user/cart/calculate/$cartId', queryParameters: data, ); return ApiResult.success( data: GetCalculateModel.fromJson(response.data["data"]), ); } catch (e)`
*No documentation provided (generation failed).*

### `cancelOrder(num orderId) async { try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/dashboard/user/orders/$orderId/status/change?status=canceled', ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `refundOrder(num orderId, String title) async { try { final data = {"order_id": orderId, "cause": title}; final client = dioHttp.client(requireAuth: true); await client.post('/api/v1/dashboard/user/order-refunds', data: data); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `getRefundOrders(int page) async { final data = { if (LocalStorage.getSelectedCurrency() != null) 'currency_id': LocalStorage.getSelectedCurrency()?.id, 'lang': LocalStorage.getLanguage()?.locale, "perPage": 10, "page": page, }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/user/order-refunds/paginate', queryParameters: data, ); return ApiResult.success(data: RefundOrdersModel.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `getDriverLocation(int deliveryId) async { try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/orders/deliveryman/$deliveryId', ); return ApiResult.success( data: LocalLocation.fromJson( response.data["data"]["delivery_man_setting"]["location"], ), ); } catch (e)`
*No documentation provided (generation failed).*
