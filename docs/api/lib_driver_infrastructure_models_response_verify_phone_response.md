# API Reference: verify_phone_response

Source file: `lib/driver/infrastructure/models/response/verify_phone_response.dart`

## Classes

### class `VerifyPhoneResponse`

### class `VerifyData`

## Whitelisted API Endpoints

### `copyWith({ String? timestamp, bool? status, String? message, VerifyData? data, }) => VerifyPhoneResponse( timestamp: timestamp ?? _timestamp, status: status ?? _status, message: message ?? _message, data: data ?? _data, ); String? get timestamp => _timestamp; bool? get status => _status; String? get message => _message; VerifyData? get data => _data; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({String? token, ProfileData? user}) => VerifyData(token: token ?? _token, user: user ?? _user); String? get token => _token; ProfileData? get user => _user; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
