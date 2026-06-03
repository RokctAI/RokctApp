# API Reference: orders_list_notifier

Source file: `lib/customer/application/orders_list/orders_list_notifier.dart`

## Classes

### class `OrdersListNotifier`

## Whitelisted API Endpoints

### `build() => const OrdersListState(); int activeOrder = 1; int historyOrder = 1; int refundOrder = 1; Future<void> fetchActiveOrdersPage( BuildContext context, RefreshController controller, { bool isRefresh = false, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchHistoryOrdersPage(BuildContext context, RefreshController controller, { bool isRefresh = false, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchRefundOrdersPage(BuildContext context, RefreshController controller, { bool isRefresh = false, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchActiveOrders(BuildContext context) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchHistoryOrders(BuildContext context) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `fetchRefundOrders(BuildContext context) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*
