# API Reference: create_order_notifier

Source file: `lib/manager/application/order/create_order_notifier.dart`

## Classes

### class `CreateOrderNotifier`

## Whitelisted API Endpoints

### `CreateOrderState()); Future<void> createOrder({ required String deliveryType, UserData? user, required List<Stock> stocks, required String deliveryDate, required String address, required int? tableId, LocationData? location, required String entrance, required String floor, required String house, ValueChanged<int>? orderSuccess, Function(String)? failed, }) async { state = state.copyWith(isCreating: true); final response = await _ordersRepository.createOrder( deliveryType: deliveryType, user: user, stocks: stocks, deliveryTime: deliveryDate, address: address, location: location, tableId: tableId, entrance: entrance.isEmpty ? null : entrance.trim(), house: house.isEmpty ? null : house.trim(), floor: floor.isEmpty ? null : floor.trim(), ); response.when( success: (data) async { state = state.copyWith(isCreating: false); orderSuccess?.call(data.data?.id ?? 0); }, failure: (failure, status)`
*No documentation provided (generation failed).*
