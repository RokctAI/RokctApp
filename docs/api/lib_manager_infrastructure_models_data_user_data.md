# API Reference: user_data

Source file: `lib/manager/infrastructure/models/data/user_data.dart`

## Classes

### class `UserData`

### class `Wallet`

## Whitelisted API Endpoints

### `copyWith({ int? id, String? uuid, String? firstname, String? lastname, String? email, String? phone, String? birthday, String? gender, bool? active, String? img, String? role, List<AddressData>? addresses, ShopData? shop, Wallet? wallet, }) => UserData( id: id ?? _id, uuid: uuid ?? _uuid, firstname: firstname ?? _firstname, lastname: lastname ?? _lastname, email: email ?? _email, phone: phone ?? _phone, birthday: birthday ?? _birthday, gender: gender ?? _gender, active: active ?? _active, img: img ?? _img, role: role ?? _role, addresses: addresses ?? _addresses, shop: shop ?? _shop, wallet: wallet ?? _wallet, ); int? get id => _id; String? get uuid => _uuid; String? get firstname => _firstname; String? get lastname => _lastname; String? get email => _email; String? get phone => _phone; String? get birthday => _birthday; String? get gender => _gender; bool? get active => _active; String? get img => _img; String? get role => _role; List<AddressData>? get addresses => _addresses; ShopData? get shop => _shop; Wallet? get wallet => _wallet; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ String? uuid, int? userId, int? currencyId, num? price, String? symbol, String? createdAt, String? updatedAt, CurrencyData? currency, }) => Wallet( uuid: uuid ?? _uuid, userId: userId ?? _userId, currencyId: currencyId ?? _currencyId, price: price ?? _price, symbol: symbol ?? _symbol, createdAt: createdAt ?? _createdAt, updatedAt: updatedAt ?? _updatedAt, currency: currency ?? _currency, ); String? get uuid => _uuid; int? get userId => _userId; int? get currencyId => _currencyId; num? get price => _price; String? get symbol => _symbol; String? get createdAt => _createdAt; String? get updatedAt => _updatedAt; CurrencyData? get currency => _currency; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
