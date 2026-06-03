# API Reference: cashback_response

Source file: `lib/customer/models/response/cashback_response.dart`

## Classes

### class `CashbackResponse`

### class `CashbackData`

## Whitelisted API Endpoints

### `copyWith({ String? timestamp, bool? status, String? message, CashbackData? data, }) => CashbackResponse( timestamp: timestamp ?? _timestamp, status: status ?? _status, message: message ?? _message, data: data ?? _data, ); String? get timestamp => _timestamp; bool? get status => _status; String? get message => _message; CashbackData? get data => _data; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({num? price}) => CashbackData(price: price ?? _price); num? get price => _price; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
