# API Reference: parcel_repository

Source file: `lib/customer/repository/parcel_repository.dart`

## Classes

### class `ParcelRepository`

## Whitelisted API Endpoints

### `addReview(num orderId, { required double rating, required String comment, }) async { final data = {'rating': rating, if (comment != "") 'comment': comment}; try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/dashboard/user/parcel-orders/deliveryman-review/$orderId', data: data, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `getTypes() async { final data = {'lang': LocalStorage.getLanguage()?.locale}; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/parcel-order/types', queryParameters: data, ); return ApiResult.success( data: ParcelTypeResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getCalculate({ required int typeId, required LocationData from, required LocationData to, }) async { final data = { 'lang': LocalStorage.getLanguage()?.locale, 'type_id': typeId, 'currency_id': LocalStorage.getSelectedCurrency()?.id, 'address_from[latitude]': from.latitude, 'address_from[longitude]': from.longitude, 'address_to[latitude]': to.latitude, 'address_to[longitude]': to.longitude, }; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/parcel-order/calculate-price', queryParameters: data, ); return ApiResult.success( data: ParcelCalculateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `orderParcel({ required int typeId, required LocationData from, required String fromTitle, required LocationData to, required String toTitle, required String time, required String note, required String phoneFrom, required String phoneTo, required String usernameTo, required String floorTo, required String floorFrom, required String houseFrom, required String houseTo, required String value, required String comment, required String instruction, required bool notify, required String usernameFrom, }) async { final data = { 'lang': LocalStorage.getLanguage()?.locale, 'type_id': typeId, 'currency_id': LocalStorage.getSelectedCurrency()?.id, "address_from": { "address": fromTitle, "latitude": from.latitude, "longitude": from.longitude, if (floorFrom.isNotEmpty) 'stage': floorFrom, if (houseFrom.isNotEmpty) 'house': houseFrom, }, "address_to": { "address": toTitle, "latitude": to.latitude, "longitude": to.longitude, if (floorTo.isNotEmpty) 'stage': floorTo, if (houseTo.isNotEmpty) 'house': houseTo, }, 'rate': LocalStorage.getSelectedCurrency()?.rate, 'delivery_date': DateFormat("yyyy-MM-dd").format(DateTime.now()), 'delivery_time': time, if (comment.isNotEmpty) 'note': comment, if (instruction.isNotEmpty) 'instruction': instruction, if (note.isNotEmpty) 'description': note, if (value.isNotEmpty) 'qr_value': value, 'phone_from': phoneFrom, 'phone_to': phoneTo, 'notify': notify ? 1 : 0, 'username_from': usernameFrom, 'username_to': usernameTo, }; try { final client = dioHttp.client(requireAuth: true); final res = await client.post( '/api/v1/dashboard/user/parcel-orders', data: data, ); return ApiResult.success(data: res.data["data"]["id"]); } catch (e)`
*No documentation provided (generation failed).*

### `getActiveParcel(int page) async { final data = { if (LocalStorage.getSelectedCurrency() != null) 'currency_id': LocalStorage.getSelectedCurrency()?.id, 'lang': LocalStorage.getLanguage()?.locale, 'page': page, 'statuses[0]': "new", "statuses[1]": "accepted", "statuses[2]": "ready", "statuses[3]": "on_a_way", "order_statuses": true, "perPage": 10, }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/user/parcel-orders', queryParameters: data, ); return ApiResult.success( data: ParcelPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getHistoryParcel(int page) async { final data = { if (LocalStorage.getSelectedCurrency() != null) 'currency_id': LocalStorage.getSelectedCurrency()?.id, 'lang': LocalStorage.getLanguage()?.locale, 'statuses[0]': "delivered", "statuses[1]": "canceled", "order_statuses": true, "perPage": 10, "page": page, }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/user/parcel-orders', queryParameters: data, ); return ApiResult.success( data: ParcelPaginateResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getSingleParcel(num orderId) async { final data = { if (LocalStorage.getSelectedCurrency() != null) 'currency_id': LocalStorage.getSelectedCurrency()?.id, 'lang': LocalStorage.getLanguage()?.locale, }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/user/parcel-orders/$orderId', queryParameters: data, ); return ApiResult.success( data: ParcelOrder.fromJson(response.data["data"]), ); } catch (e)`
*No documentation provided (generation failed).*

### `process(num orderId, String name) async { try { final client = dioHttp.client(requireAuth: true); var res = await client.get( '/api/v1/dashboard/user/order-$name-process?parcel_id=$orderId', queryParameters: {if (name == "pay-fast") "type": 'mobile'}, ); if (name == "pay-fast")`
*No documentation provided (generation failed).*

### `createTransaction({ required int orderId, required int paymentId, }) async { final data = {'payment_sys_id': paymentId}; try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/payments/parcel-order/$orderId/transactions', data: data, ); return ApiResult.success( data: TransactionsResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*
