# API Reference: auto_order_notifier

Source file: `lib/customer/application/auto_order/auto_order_notifier.dart`

## Classes

### class `AutoOrderNotifier`

## Whitelisted API Endpoints

### `build()`
*No documentation provided (generation failed).*

### `AutoOrderState(from: DateTime.now().add(const Duration(days: 1)), to: DateTime.now().add(const Duration(days: 7)), ); } void pickFrom(DateTime date)`
*No documentation provided (generation failed).*

### `pickTo(DateTime date)`
*No documentation provided (generation failed).*

### `isValidDates()`
*No documentation provided (generation failed).*

### `isTimeChanged(RepeatData? repeatData)`
*No documentation provided (generation failed).*

### `startAutoOrder({ required String orderId, required BuildContext context, VoidCallback? onSuccess, }) async { final res = await ordersRepository.createAutoOrder( orderId: orderId, startDate: DateFormat('yyyy-MM-dd').format(state.from), endDate: DateFormat('yyyy-MM-dd').format(state.to), ); res.when( success: (data)`
*No documentation provided (generation failed).*

### `deleteAutoOrder({ required String orderId, required BuildContext context, }) async { final res = await ordersRepository.deleteAutoOrder(orderId); res.when( success: (data)`
*No documentation provided (generation failed).*
