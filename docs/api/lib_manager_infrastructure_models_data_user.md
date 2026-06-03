# API Reference: user

Source file: `lib/manager/infrastructure/models/data/user.dart`

## Classes

### class `UserModel`

## Whitelisted API Endpoints

### `copyWith({ int? id, String? uuid, String? firstname, String? lastname, String? referral, String? email, String? phone, String? birthday, String? gender, String? emailVerifiedAt, String? registeredAt, bool? active, String? img, String? role, String? password, String? conPassword, }) => UserModel( id: id ?? _id, uuid: uuid ?? _uuid, firstname: firstname ?? _firstname, lastname: lastname ?? _lastname, referral: referral ?? _referral, email: email ?? _email, phone: phone ?? _phone, birthday: birthday ?? _birthday, gender: gender ?? _gender, emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt, registeredAt: registeredAt ?? _registeredAt, active: active ?? _active, img: img ?? _img, role: role ?? _role, confirmPassword: conPassword ?? _confirmPassword, password: password ?? _password, ); int? get id => _id; String? get uuid => _uuid; String? get firstname => _firstname; String? get lastname => _lastname; String? get referral => _referral; String? get email => _email; String? get phone => _phone; String? get birthday => _birthday; String? get gender => _gender; String? get emailVerifiedAt => _emailVerifiedAt; String? get registeredAt => _registeredAt; bool? get active => _active; String? get img => _img; String? get role => _role; String? get password => _password; String? get conPassword => _confirmPassword; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
