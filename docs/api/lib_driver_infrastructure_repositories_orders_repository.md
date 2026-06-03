# API Reference: orders_repository

Source file: `lib/driver/infrastructure/repositories/orders_repository.dart`

## Classes

### class `OrdersRepository`

## Whitelisted API Endpoints

### `getActiveOrders(int page) async { final data = { 'currency_id': LocalStorage.getSelectedCurrency()!.id, 'lang': LocalStorage.getLanguage()?.locale ?? 'en', 'page': page, "statuses[1]": "accepted", "statuses[2]": "ready", "statuses[3]": "on_a_way", "perPage": 10, "delivery_type": "delivery", }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/deliveryman/orders/paginate', queryParameters: data, ); return ApiResult.success( data: OrderPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getProgressOrders(int page) async { final data = { 'currency_id': LocalStorage.getSelectedCurrency()!.id, 'lang': LocalStorage.getLanguage()?.locale ?? 'en', 'page': page, "statuses[2]": "ready", "statuses[3]": "on_a_way", "perPage": 10, "delivery_type": "delivery", }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/deliveryman/orders/paginate', queryParameters: data, ); return ApiResult.success( data: OrderPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getAvailableOrders(int page) async { final data = { 'currency_id': LocalStorage.getSelectedCurrency()!.id, 'lang': LocalStorage.getLanguage()?.locale ?? 'en', 'page': page, "status": "ready", "empty-deliveryman": 1, "perPage": 10, "delivery_type": "delivery", "address": { "latitude": LocalStorage.getAddressSelected()?.latitude ?? AppConstants.demoLatitude, "longitude": LocalStorage.getAddressSelected()?.longitude ?? AppConstants.demoLongitude, }, }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/deliveryman/orders/paginate', queryParameters: data, ); return ApiResult.success( data: OrderPaginateResponse.fromJson(response.data).data ?? [], ); } catch (e)`
*No documentation provided (generation failed).*

### `showOrders(int id) async { final data = { 'currency_id': LocalStorage.getSelectedCurrency()?.id, 'lang': LocalStorage.getLanguage()?.locale ?? 'en', }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/deliveryman/orders/$id', queryParameters: data, ); return ApiResult.success(data: OrderDetailModel.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `getHistoryOrders(int page, { DateTime? start, DateTime? end, List<String>? status, }) async { final data = { 'currency_id': LocalStorage.getSelectedCurrency()!.id, 'lang': LocalStorage.getLanguage()?.locale ?? 'en', 'page': page, "status": status ?? ["ready", "on_a_way", "delivered", "canceled"], "perPage": 10, if (start != null) "delivery_date_from": DateFormat("yyyy-MM-dd").format(start), if (end != null) "delivery_date_to": DateFormat("yyyy-MM-dd").format(end), }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/deliveryman/orders/paginate', queryParameters: data, ); return ApiResult.success( data: OrderPaginateResponse.fromJson(response.data).data ?? [], ); } catch (e)`
*No documentation provided (generation failed).*

### `setCurrentOrder(int? orderId) async { try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/dashboard/deliveryman/orders/$orderId/current', ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `fetchCurrentOrder() async { try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/deliveryman/orders/paginate?perPage=1&lang=en&current=1', ); return ApiResult.success( data: OrderPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `updateOrder(int? orderId, String? status) async { try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/dashboard/deliveryman/order/$orderId/status/update', data: {"status": status}, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `uploadImage(int? orderId, String? image) async { try { final client = dioHttp.client(requireAuth: true); await client.post( 'https://api.foodyman.org/api/v1/dashboard/deliveryman/orders/$orderId/image', data: {"img": image}, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `addReview(num orderId, { required double rating, required String comment, }) async { final data = {'rating': rating, if (comment.isNotEmpty) 'comment': comment}; try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/dashboard/deliveryman/orders/$orderId/review', data: data, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `setOrder(String orderId) async { try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/dashboard/deliveryman/order/$orderId/attach/me', ); return ApiResult.success(data: OrderDetailModel.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `cancelOrder(int orderId, String note) async { try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/dashboard/deliveryman/order/$orderId/status/update?status=canceled', data: {"note": note}, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*
