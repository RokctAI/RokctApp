# API Reference: user_data

Source file: `lib/driver/infrastructure/models/data/user_data.dart`

## Classes

### class `UserData`

### class `Wallet`

## Whitelisted API Endpoints

### `copyWith({ int? id, String? uuid, String? firstname, String? lastname, String? referral, String? email, String? phone, String? birthday, String? gender, String? emailVerifiedAt, String? registeredAt, bool? active, String? img, double? rate, String? role, List<AddressData>? addresses, List<List<double>>? deliveryZone, ShopData? shop, Wallet? wallet, String? password, String? conPassword, }) => UserData( id: id ?? _id, uuid: uuid ?? _uuid, firstname: firstname ?? _firstname, lastname: lastname ?? _lastname, email: email ?? _email, phone: phone ?? _phone, birthday: birthday ?? _birthday, gender: gender ?? _gender, emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt, registeredAt: registeredAt ?? _registeredAt, deliveryZone: deliveryZone ?? _deliveryZone, active: active ?? _active, img: img ?? _img, rate: rate ?? _rate, role: role ?? _role, addresses: addresses ?? _addresses, shop: shop ?? _shop, wallet: wallet ?? _wallet, confirmPassword: conPassword ?? _confirmPassword, password: password ?? _password, referral: referral ?? _referral, ); int? get id => _id; num? get rate => _rate; String? get uuid => _uuid; String? get firstname => _firstname; String? get lastname => _lastname; String? get email => _email; String? get phone => _phone; String? get birthday => _birthday; String? get gender => _gender; String? get emailVerifiedAt => _emailVerifiedAt; String? get registeredAt => _registeredAt; bool? get active => _active; List<List<double>>? get deliveryZone => _deliveryZone; String? get img => _img; String? get role => _role; List<AddressData>? get addresses => _addresses; ShopData? get shop => _shop; Wallet? get wallet => _wallet; String? get referral => _referral; String? get password => _password; String? get conPassword => _confirmPassword; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ String? uuid, int? userId, int? currencyId, num? price, String? symbol, String? createdAt, String? updatedAt, CurrencyData? currency, }) => Wallet( uuid: uuid ?? _uuid, userId: userId ?? _userId, currencyId: currencyId ?? _currencyId, price: price ?? _price, symbol: symbol ?? _symbol, createdAt: createdAt ?? _createdAt, updatedAt: updatedAt ?? _updatedAt, currency: currency ?? _currency, ); String? get uuid => _uuid; int? get userId => _userId; int? get currencyId => _currencyId; num? get price => _price; String? get symbol => _symbol; String? get createdAt => _createdAt; String? get updatedAt => _updatedAt; CurrencyData? get currency => _currency; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
