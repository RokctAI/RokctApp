# API Reference: orders_repository

Source file: `lib/customer/repository/orders_repository.dart`

## Classes

### class `OrdersRepository`

## Whitelisted API Endpoints

### `createOrder(OrderBodyData orderBody, ) async { try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/method/paas.api.order.order.create_order', data: orderBody.toJson(), ); final responseData = OrderActiveModel.fromJson(response.data); await appDatabase.upsertOrder(responseData.toJson()); return ApiResult.success(data: responseData); } catch (e)`
*No documentation provided (generation failed).*

### `getCompletedOrders(int page)`
*No documentation provided (generation failed).*

### `addReview(String orderId, { required double rating, required String comment, }) async { final data = { 'order_id': orderId, 'rating': rating, if (comment.isNotEmpty) 'comment': comment, }; try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/method/paas.api.order.order.add_order_review', data: data, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `process(OrderBodyData orderBody, String name, { bool forceCardPayment = false, bool enableTokenization = false, }) async { try { final client = dioHttp.client(requireAuth: true); var res = await client.post( '/api/v1/method/paas.api.payment.payment.initiate_${name.toLowerCase()}_payment', data: {'order_id': orderBody.cartId}, ); return ApiResult.success(data: res.data['redirect_url']); } catch (e, s)`
*No documentation provided (generation failed).*

### `cancelOrder(String orderId, [String? note]) async { try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/method/paas.api.order.order.cancel_order', data: {'order_id': orderId}, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `refundOrder(String orderId, String title) async { final data = {'order': orderId, 'cause': title}; try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/method/paas.api.user.user.create_order_refund', data: data, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `getRefundOrders(int page) async { final data = {'page': page}; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/method/paas.api.user.user.get_user_order_refunds', queryParameters: data, ); return ApiResult.success(data: RefundOrdersModel.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `getCalculate({ required String cartId, required double lat, required double long, required DeliveryTypeEnum type, String? coupon, }) async { final data = { 'cart_id': cartId, 'address': {'latitude': lat, 'longitude': long}, if (coupon != null) 'coupon': coupon, }; try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/method/paas.api.order.order.get_calculate', data: data, ); return ApiResult.success( data: GetCalculateModel.fromJson(response.data['message']), ); } catch (e)`
*No documentation provided (generation failed).*

### `checkCoupon({ required String coupon, required String shopId, }) async { final data = {'coupon': coupon, 'shop': shopId}; try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/method/paas.api.coupon.coupon.check_coupon', data: data, ); return ApiResult.success(data: CouponResponse.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `checkCashback({ required double amount, required String shopId, }) async { try { final client = dioHttp.client(requireAuth: false); final response = await client.post( '/api/v1/method/paas.api.shop.shop.check_cashback', data: {'shop_id': shopId, 'amount': amount}, ); return ApiResult.success( data: CashbackResponse.fromJson(response.data['message']), ); } catch (e)`
*No documentation provided (generation failed).*

### `createAutoOrder({ required String orderId, required String startDate, String? endDate, String? cronPattern, String? paymentMethod, String? savedCardId, }) async { try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/method/paas.api.repeating_order.create_repeating_order', data: { 'original_order': orderId, 'start_date': startDate, 'cron_pattern': cronPattern ?? '0 0 * * *', if (endDate != null) 'end_date': endDate, if (paymentMethod != null) 'payment_method': paymentMethod, if (savedCardId != null) 'saved_card': savedCardId, }, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `deleteAutoOrder(String orderId) async { try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/method/paas.api.repeating_order.delete_repeating_order', data: {'repeating_order_id': orderId}, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `tipProcess({ required String orderId, required double tip, }) async { try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/method/paas.api.payment.payment.tip_process', data: {'order_id': orderId, 'tip': tip}, ); return ApiResult.success(data: response.data['redirect_url']); } catch (e)`
*No documentation provided (generation failed).*

### `getDriverLocation(String deliveryId) async { try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/method/paas.api.delivery.delivery.get_driver_location', queryParameters: {'order_id': deliveryId}, ); return ApiResult.success( data: LocalLocation.fromJson(response.data['message']), ); } catch (e)`
*No documentation provided (generation failed).*
