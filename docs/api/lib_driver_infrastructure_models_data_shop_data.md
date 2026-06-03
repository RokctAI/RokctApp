# API Reference: shop_data

Source file: `lib/driver/infrastructure/models/data/shop_data.dart`

## Classes

### class `ShopData`

### class `Seller`

## Whitelisted API Endpoints

### `copyWith({ int? id, String? uuid, int? userId, num? tax, num? deliveryRange, num? percentage, LocalLocationData? location, String? phone, bool? showType, bool? open, bool? visibility, String? openTime, String? closeTime, String? backgroundImg, String? logoImg, num? minAmount, String? status, String? statusNote, String? ratingAvg, String? createdAt, String? updatedAt, Dyn deletedAt, Translation? translation, Seller? seller, List<ShopDelivery>? deliveries, }) => ShopData( id: id ?? _id, uuid: uuid ?? _uuid, userId: userId ?? _userId, tax: tax ?? _tax, deliveryRange: deliveryRange ?? _deliveryRange, percentage: percentage ?? _percentage, location: location ?? _location, phone: phone ?? _phone, showType: showType ?? _showType, open: open ?? _open, visibility: visibility ?? _visibility, openTime: openTime ?? _openTime, closeTime: closeTime ?? _closeTime, backgroundImg: backgroundImg ?? _backgroundImg, logoImg: logoImg ?? _logoImg, minAmount: minAmount ?? _minAmount, status: status ?? _status, statusNote: statusNote ?? _statusNote, ratingAvg: ratingAvg ?? _ratingAvg, createdAt: createdAt ?? _createdAt, updatedAt: updatedAt ?? _updatedAt, deletedAt: deletedAt ?? _deletedAt, translation: translation ?? _translation, seller: seller ?? _seller, deliveries: deliveries ?? _deliveries, ); int? get id => _id; String? get uuid => _uuid; int? get userId => _userId; num? get tax => _tax; num? get deliveryRange => _deliveryRange; num? get percentage => _percentage; LocalLocationData? get location => _location; String? get phone => _phone; bool? get showType => _showType; bool? get open => _open; bool? get visibility => _visibility; String? get openTime => _openTime; String? get closeTime => _closeTime; String? get backgroundImg => _backgroundImg; String? get logoImg => _logoImg; num? get minAmount => _minAmount; String? get status => _status; String? get statusNote => _statusNote; String? get ratingAvg => _ratingAvg; String? get createdAt => _createdAt; String? get updatedAt => _updatedAt; Dyn get deletedAt => _deletedAt; Translation? get translation => _translation; Seller? get seller => _seller; List<ShopDelivery>? get deliveries => _deliveries; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ int? id, String? firstname, String? lastname, String? role, }) => Seller( id: id ?? _id, firstname: firstname ?? _firstname, lastname: lastname ?? _lastname, role: role ?? _role, ); int? get id => _id; String? get firstname => _firstname; String? get lastname => _lastname; String? get role => _role; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
