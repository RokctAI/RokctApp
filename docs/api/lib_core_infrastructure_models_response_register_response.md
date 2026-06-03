# API Reference: register_response

Source file: `lib/core/infrastructure/models/response/register_response.dart`

## Classes

### class `RegisterResponse`

### class `RegisterData`

## Whitelisted API Endpoints

### `copyWith({ String? timestamp, bool? status, String? message, RegisterData? data, }) => RegisterResponse( timestamp: timestamp ?? _timestamp, status: status ?? _status, message: message ?? _message, data: data ?? _data, ); String? get timestamp => _timestamp; bool? get status => _status; String? get message => _message; RegisterData? get data => _data; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({String? verifyId, String? phone}) => RegisterData(verifyId: verifyId ?? _verifyId, phone: phone ?? _phone); String? get verifyId => _verifyId; String? get phone => _phone; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
