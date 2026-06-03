# API Reference: wallet_histories_response

Source file: `lib/customer/models/response/wallet_histories_response.dart`

## Classes

### class `WalletHistoriesResponse`

### class `WalletData`

## Whitelisted API Endpoints

### `copyWith({ List<WalletData>? data, Links? links, Meta? meta, }) => WalletHistoriesResponse( data: data ?? _data, links: links ?? _links, meta: meta ?? _meta, ); List<WalletData>? get data => _data; Links? get links => _links; Meta? get meta => _meta; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ int? id, String? uuid, String? walletUuid, int? transactionId, String? type, num? price, String? note, String? status, String? createdAt, String? updatedAt, UserModel? author, UserModel? user, }) => WalletData( id: id ?? _id, uuid: uuid ?? _uuid, walletUuid: walletUuid ?? _walletUuid, transactionId: transactionId ?? _transactionId, type: type ?? _type, price: price ?? _price, note: note ?? _note, status: status ?? _status, createdAt: createdAt ?? _createdAt, updatedAt: updatedAt ?? _updatedAt, author: author ?? _author, user: user ?? _user, ); int? get id => _id; String? get uuid => _uuid; String? get walletUuid => _walletUuid; int? get transactionId => _transactionId; String? get type => _type; num? get price => _price; String? get note => _note; String? get status => _status; String? get createdAt => _createdAt; String? get updatedAt => _updatedAt; UserModel? get author => _author; UserModel? get user => _user; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
