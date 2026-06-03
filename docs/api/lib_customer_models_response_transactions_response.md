# API Reference: transactions_response

Source file: `lib/customer/models/response/transactions_response.dart`

## Classes

### class `TransactionsResponse`

### class `TransactionData`

### class `TransactionDetails`

## Whitelisted API Endpoints

### `copyWith({ String? timestamp, bool? status, String? message, TransactionData? data, }) => TransactionsResponse( timestamp: timestamp ?? _timestamp, status: status ?? _status, message: message ?? _message, data: data ?? _data, ); String? get timestamp => _timestamp; bool? get status => _status; String? get message => _message; TransactionData? get data => _data; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ int? id, int? userId, num? price, num? currencyPrice, num? rate, String? createdAt, String? updatedAt, String? status, String? tag, List<TransactionDetails>? details, }) => TransactionData( id: id ?? _id, userId: userId ?? _userId, price: price ?? _price, currencyPrice: currencyPrice ?? _currencyPrice, rate: rate ?? _rate, createdAt: createdAt ?? _createdAt, updatedAt: updatedAt ?? _updatedAt, details: details ?? _details, status: status ?? _status, tag: tag ?? _tag, ); int? get id => _id; int? get userId => _userId; num? get price => _price; num? get currencyPrice => _currencyPrice; num? get rate => _rate; String? get createdAt => _createdAt; String? get updatedAt => _updatedAt; String? get status => _status; String? get tag => _tag; List<TransactionDetails>? get details => _details; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ int? id, int? shopId, num? deliveryFee, num? price, num? tax, String? status, String? deliveryDate, String? deliveryTime, String? createdAt, String? updatedAt, }) => TransactionDetails( id: id ?? _id, shopId: shopId ?? _shopId, deliveryFee: deliveryFee ?? _deliveryFee, price: price ?? _price, tax: tax ?? _tax, status: status ?? _status, deliveryDate: deliveryDate ?? _deliveryDate, deliveryTime: deliveryTime ?? _deliveryTime, createdAt: createdAt ?? _createdAt, updatedAt: updatedAt ?? _updatedAt, ); int? get id => _id; int? get shopId => _shopId; num? get deliveryFee => _deliveryFee; num? get price => _price; num? get tax => _tax; String? get status => _status; String? get deliveryDate => _deliveryDate; String? get deliveryTime => _deliveryTime; String? get createdAt => _createdAt; String? get updatedAt => _updatedAt; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
