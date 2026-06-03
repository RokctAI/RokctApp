# API Reference: parcel_notifier

Source file: `lib/driver/application/parcel/parcel_notifier.dart`

## Classes

### class `ParcelNotifier`

## Whitelisted API Endpoints

### `ParcelState()); int activeOrder = 1; int historyOrder = 1; int availableOrderPage = 1; void changeDeliveryType(int index)`
*No documentation provided (generation failed).*

### `changeDeliveryTime(int index)`
*No documentation provided (generation failed).*

### `changePaymentType(bool isActive)`
*No documentation provided (generation failed).*

### `showOrder(BuildContext context, int orderId) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchActiveOrders(BuildContext context) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchAvailableOrders(BuildContext context) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchActiveOrdersPage(BuildContext context, RefreshController controller, { bool isRefresh = false, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchAvailableOrdersPage(BuildContext context, RefreshController controller, { bool isRefresh = false, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchHistoryOrders(BuildContext context, { DateTime? start, DateTime? end, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchHistoryOrdersPage(BuildContext context, RefreshController controller, { bool isRefresh = false, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*
