# API Reference: order_status_response

Source file: `lib/manager/infrastructure/models/response/order_status_response.dart`

## Classes

### class `OrderStatusResponse`

### class `OrderStatusData`

## Whitelisted API Endpoints

### `copyWith({OrderStatusData? data}) => OrderStatusResponse(data: data ?? _data); OrderStatusData? get data => _data; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ int? id, int? shopId, num? deliveryFee, num? price, num? tax, String? status, String? deliveryDate, String? deliveryTime, }) => OrderStatusData( id: id ?? _id, shopId: shopId ?? _shopId, deliveryFee: deliveryFee ?? _deliveryFee, price: price ?? _price, tax: tax ?? _tax, status: status ?? _status, deliveryDate: deliveryDate ?? _deliveryDate, deliveryTime: deliveryTime ?? _deliveryTime, ); int? get id => _id; int? get shopId => _shopId; num? get deliveryFee => _deliveryFee; num? get price => _price; num? get tax => _tax; String? get status => _status; String? get deliveryDate => _deliveryDate; String? get deliveryTime => _deliveryTime; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
