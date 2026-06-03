# API Reference: login_response

Source file: `lib/customer/models/response/login_response.dart`

## Classes

### class `LoginResponse`

### class `UserData`

## Whitelisted API Endpoints

### `copyWith({ String? timestamp, bool? status, String? message, UserData? data, }) => LoginResponse( timestamp: timestamp ?? _timestamp, status: status ?? _status, message: message ?? _message, data: data ?? _data, ); String? get timestamp => _timestamp; bool? get status => _status; String? get message => _message; UserData? get data => _data; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ String? accessToken, String? tokenType, UserModel? user, }) => UserData( accessToken: accessToken ?? _accessToken, tokenType: tokenType ?? _tokenType, user: user ?? _user, ); String? get accessToken => _accessToken; String? get tokenType => _tokenType; UserModel? get user => _user; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
