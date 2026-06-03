# API Reference: order_payment_notifier

Source file: `lib/manager/application/order/shipping/payment/order_payment_notifier.dart`

## Classes

### class `OrderPaymentNotifier`

## Whitelisted API Endpoints

### `OrderPaymentState()); void setSelectedIndex(int index)`
*No documentation provided (generation failed).*

### `clearAll()`
*No documentation provided (generation failed).*

### `fetchPayments(String type) async { state = state.copyWith(isLoading: true); final response = await _ordersRepository.getPayments(); response.when( success: (data)`
*No documentation provided (generation failed).*

### `createTransaction(BuildContext context, int orderId, int? paymentId, ) async { var response = await _ordersRepository.createTransaction( orderId: orderId, paymentId: paymentId ?? 0, ); response.when( success: (data)`
*No documentation provided (generation failed).*

### `getCalculate({ required List<Stock> stocks, required String type, LocationData? location, }) async { state = state.copyWith(isCalculateLoading: true); final response = await _ordersRepository.getCalculate( stocks: stocks, type: type, location: location, ); response.when( success: (data)`
*No documentation provided (generation failed).*
