# API Reference: order_details_notifier

Source file: `lib/manager/application/order_details/order_details_notifier.dart`

## Classes

### class `OrderDetailsNotifier`

## Whitelisted API Endpoints

### `OrderDetailsState()); Future<void> updateOrderStatus( BuildContext context, { required OrderStatus status, VoidCallback? success, }) async { state = state.copyWith(isUpdating: true); final response = await _ordersRepository.updateOrderStatus( status: status, orderId: state.order?.id, ); response.when( success: (data)`
*No documentation provided (generation failed).*

### `toggleOrderDetailChecked({required int index})`
*No documentation provided (generation failed).*

### `fetchOrderDetails({OrderData? order}) async { state = state.copyWith(isLoading: true, order: order); final response = await _ordersRepository.getOrderDetails( orderId: order?.id, ); response.when( success: (data)`
*No documentation provided (generation failed).*
