# API Reference: parcel_repository

Source file: `lib/driver/infrastructure/repositories/parcel_repository.dart`

## Classes

### class `ParcelRepository`

## Whitelisted API Endpoints

### `getActiveOrders(int page) async { final data = { 'currency_id': LocalStorage.getSelectedCurrency()!.id, 'lang': LocalStorage.getLanguage()?.locale ?? 'en', 'page': page, "statuses[1]": "accepted", "statuses[2]": "ready", "statuses[3]": "on_a_way", "perPage": 10, "delivery_type": "delivery", }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/deliveryman/parcel-orders/paginate', queryParameters: data, ); return ApiResult.success( data: ParcelPaginateResponse.fromJson(response.data).data ?? [], ); } catch (e)`
*No documentation provided (generation failed).*

### `getAvailableOrders(int page) async { final data = { 'currency_id': LocalStorage.getSelectedCurrency()!.id, 'lang': LocalStorage.getLanguage()?.locale ?? 'en', 'page': page, "status": "ready", "empty-deliveryman": 1, "perPage": 10, "delivery_type": "delivery", }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/deliveryman/parcel-orders/paginate', queryParameters: data, ); return ApiResult.success( data: ParcelPaginateResponse.fromJson(response.data).data ?? [], ); } catch (e)`
*No documentation provided (generation failed).*

### `showParcel(int id) async { final data = { 'currency_id': LocalStorage.getSelectedCurrency()?.id, 'lang': LocalStorage.getLanguage()?.locale ?? 'en', }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/deliveryman/parcel-orders$id', queryParameters: data, ); return ApiResult.success(data: ParcelOrder.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `getHistoryOrders(int page, { DateTime? start, DateTime? end, }) async { final data = { 'currency_id': LocalStorage.getSelectedCurrency()!.id, 'lang': LocalStorage.getLanguage()?.locale ?? 'en', 'page': page, "status": "delivered", "perPage": 10, if (start != null) "delivery_date_from": DateFormat("yyyy-MM-dd").format(start), if (end != null) "delivery_date_to": DateFormat("yyyy-MM-dd").format(end), }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/deliveryman/parcel-orders/paginate', queryParameters: data, ); return ApiResult.success( data: ParcelPaginateResponse.fromJson(response.data).data ?? [], ); } catch (e)`
*No documentation provided (generation failed).*

### `setCurrentOrder(int? orderId) async { try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/dashboard/deliveryman/parcel-orders$orderId/current', ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `updateParcel(int? parcelId, String? status) async { try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/dashboard/deliveryman/parcel-orders/$parcelId/status/update', data: {"status": status}, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `addReviewParcel(num orderId, { required double rating, required String comment, }) async { final data = {'rating': rating, if (comment.isNotEmpty) 'comment': comment}; try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/dashboard/deliveryman/parcel-orders/$orderId/review', data: data, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `setParcel(String parcelId) async { try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/dashboard/deliveryman/parcel-order/$parcelId/attach/me', ); return ApiResult.success(data: ParcelOrder.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*
