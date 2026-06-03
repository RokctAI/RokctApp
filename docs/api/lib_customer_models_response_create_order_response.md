# API Reference: create_order_response

Source file: `lib/customer/models/response/create_order_response.dart`

## Classes

### class `CreateOrderResponse`

### class `CreatedOrder`

## Whitelisted API Endpoints

### `copyWith({ String? timestamp, bool? status, String? message, CreatedOrder? data, }) => CreateOrderResponse( timestamp: timestamp ?? _timestamp, status: status ?? _status, message: message ?? _message, data: data ?? _data, ); String? get timestamp => _timestamp; bool? get status => _status; String? get message => _message; CreatedOrder? get data => _data; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ int? id, int? userId, num? price, num? currencyPrice, num? rate, String? createdAt, String? updatedAt, }) => CreatedOrder( id: id ?? _id, userId: userId ?? _userId, price: price ?? _price, currencyPrice: currencyPrice ?? _currencyPrice, rate: rate ?? _rate, createdAt: createdAt ?? _createdAt, updatedAt: updatedAt ?? _updatedAt, ); int? get id => _id; int? get userId => _userId; num? get price => _price; num? get currencyPrice => _currencyPrice; num? get rate => _rate; String? get createdAt => _createdAt; String? get updatedAt => _updatedAt; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
