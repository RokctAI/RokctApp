# API Reference: shop_order_notifier

Source file: `lib/customer/application/shop_order/shop_order_notifier.dart`

## Classes

### class `ShopOrderNotifier`

## Whitelisted API Endpoints

### `build() => const ShopOrderState(); final _delayed = Delayed(milliseconds: 700); Future<void> addCount(BuildContext context, int index) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `removeCount(BuildContext context, int index) async { state = state.copyWith(isAddAndRemoveLoading: true); if ((state.cart?.userCarts?.first.cartDetails?[index].quantity ?? 1) > 1)`
*No documentation provided (generation failed).*

### `addCountWithGroup({ required BuildContext context, required int productIndex, required int userIndex, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `removeCountWithGroup({ required BuildContext context, required int productIndex, required int userIndex, }) async { if ((state .cart ?.userCarts?[userIndex] .cartDetails?[productIndex] .quantity ?? 1) > 1)`
*No documentation provided (generation failed).*

### `getCart(BuildContext context, VoidCallback onSuccess, { bool isShowLoading = true, String? shopId, String? cartId, String? userUuid, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `LoginRoute()); } }, ); } else { if (context.mounted)`
*No documentation provided (generation failed).*

### `changeStatus(BuildContext context, String? userUuid) async { final connected = await AppConnectivity.connectivity(); state = state.copyWith(isEditOrder: !state.isEditOrder); if (connected)`
*No documentation provided (generation failed).*

### `deleteCart(BuildContext context) async { final connected = await AppConnectivity.connectivity(); state = state.copyWith(isDeleteLoading: true); if (connected)`
*No documentation provided (generation failed).*

### `deleteUser(BuildContext context, int index, { String? userId, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `joinGroupOrder(BuildContext context) async { state = state.copyWith(isStartGroup: false); state = state.copyWith(isStartGroup: true); } Future<void> startGroupOrder(BuildContext context, int cartId) async { final connected = await AppConnectivity.connectivity(); state = state.copyWith(isStartGroup: false, isStartGroupLoading: true); if (connected)`
*No documentation provided (generation failed).*

### `createCart(BuildContext context, String? shopId) async { state = state.copyWith(isCheckShopOrder: false, isOtherShop: false); final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*
