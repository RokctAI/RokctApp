# API Reference: profile_data

Source file: `lib/customer/models/data/profile_data.dart`

## Classes

### class `ProfileData`

### class `Wallet`

## Whitelisted API Endpoints

### `copyWith({ int? id, String? uuid, String? firstname, String? lastname, String? referral, String? email, String? phone, String? secondPhone, String? birthday, String? gender, String? emailVerifiedAt, String? registeredAt, bool? active, String? img, String? role, List<AddressNewModel>? addresses, ShopData? shop, Wallet? wallet, }) => ProfileData( id: id ?? _id, uuid: uuid ?? _uuid, firstname: firstname ?? _firstname, lastname: lastname ?? _lastname, referral: referral ?? _referral, email: email ?? _email, phone: phone ?? _phone, secondPhone: secondPhone ?? _secondPhone, birthday: birthday ?? _birthday, gender: gender ?? _gender, emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt, registeredAt: registeredAt ?? _registeredAt, active: active ?? _active, img: img ?? _img, role: role ?? _role, addresses: addresses ?? _addresses, shop: shop ?? _shop, wallet: wallet ?? _wallet, ); int? get id => _id; String? get uuid => _uuid; String? get firstname => _firstname; String? get lastname => _lastname; num? get referralFromCount => _referralFromCount; num? get referralFromPrice => _referralFromPrice; num? get referralFromWithdrawCount => _referralFromWithdrawCount; num? get referralFromWithdrawPrice => _referralFromWithdrawPrice; String? get referral => _referral; String? get email => _email; String? get phone => _phone; String? get birthday => _birthday; String? get gender => _gender; String? get emailVerifiedAt => _emailVerifiedAt; String? get registeredAt => _registeredAt; bool? get active => _active; String? get img => _img; String? get role => _role; String? get secondPhone => _secondPhone; List<AddressNewModel>? get addresses => _addresses; List<NotificationsModel>? get notifications => _notifications; ShopData? get shop => _shop; Wallet? get wallet => _wallet; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ String? uuid, int? userId, int? id, int? currencyId, num? price, String? createdAt, String? updatedAt, CurrencyData? currency, }) => Wallet( uuid: uuid ?? _uuid, userId: userId ?? _userId, id: id ?? _id, currencyId: currencyId ?? _currencyId, price: price ?? _price, createdAt: createdAt ?? _createdAt, updatedAt: updatedAt ?? _updatedAt, currency: currency ?? _currency, ); String? get uuid => _uuid; int? get userId => _userId; int? get id => _id; int? get currencyId => _currencyId; num? get price => _price; String? get createdAt => _createdAt; String? get updatedAt => _updatedAt; CurrencyData? get currency => _currency; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
