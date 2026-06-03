# API Reference: shop_data

Source file: `lib/manager/infrastructure/models/data/shop_data.dart`

## Classes

### class `ShopData`

### class `DeliveryTime`

### class `Discount`

### class `Bonus`

### class `BonusStock`

### class `ShopPayments`

### class `ShopWorkingDays`

### class `ShopTag`

## Whitelisted API Endpoints

### `copyWith({ int? id, String? uuid, String? orderPayment, int? discountsCount, int? userId, num? price, num? pricePerKm, num? tax, num? percentage, String? phone, bool? visibility, String? backgroundImg, String? logoImg, num? minAmount, bool? isRecommended, bool? open, String? status, String? statusNote, String? type, num? avgRate, DeliveryTime? deliveryTime, String? inviteLink, num? ratingAvg, LocationData? location, int? productsCount, Translation? translation, List<Translation>? translations, List<String>? locales, UserData? seller, Dyn subscription, List<CategoryData>? categories, Bonus? bonus, List<Discount>? discount, List<ShopPayments>? shopPayments, List<ShopWorkingDays>? shopWorkingDays, List<ShopTag>? tags, }) => ShopData( id: id ?? _id, uuid: uuid ?? _uuid, orderPayment: orderPayment ?? _orderPayment, userId: userId ?? _userId, price: price ?? _price, pricePerKm: pricePerKm ?? _pricePerKm, tax: tax ?? _tax, percentage: percentage ?? _percentage, phone: phone ?? _phone, visibility: visibility ?? _visibility, open: open ?? _open, backgroundImg: backgroundImg ?? _backgroundImg, logoImg: logoImg ?? _logoImg, minAmount: minAmount ?? _minAmount, isRecommended: isRecommended ?? _isRecommended, status: status ?? _status, statusNote: statusNote ?? _statusNote, type: type ?? _type, avgRate: avgRate ?? _avgRate, deliveryTime: deliveryTime ?? _deliveryTime, inviteLink: inviteLink ?? _inviteLink, ratingAvg: ratingAvg ?? _ratingAvg, location: location ?? _location, productsCount: productsCount ?? _productsCount, translation: translation ?? _translation, translations: translations ?? _translations, locales: locales ?? _locales, seller: seller ?? _seller, subscription: subscription ?? _subscription, categories: categories ?? _categories, bonus: bonus ?? _bonus, discount: discount ?? _discount, shopPayments: shopPayments ?? _shopPayments, shopWorkingDays: shopWorkingDays ?? _shopWorkingDays, tags: tags ?? _tags, ); int? get id => _id; String? get uuid => _uuid; String? get orderPayment => _orderPayment; int? get userId => _userId; num? get price => _price; num? get pricePerKm => _pricePerKm; num? get tax => _tax; num? get percentage => _percentage; String? get phone => _phone; bool? get visibility => _visibility; String? get backgroundImg => _backgroundImg; String? get logoImg => _logoImg; num? get minAmount => _minAmount; bool? get isRecommended => _isRecommended; bool? get open => _open; String? get status => _status; String? get statusNote => _statusNote; String? get type => _type; num? get avgRate => _avgRate; DeliveryTime? get deliveryTime => _deliveryTime; String? get inviteLink => _inviteLink; num? get ratingAvg => _ratingAvg; LocationData? get location => _location; int? get productsCount => _productsCount; Translation? get translation => _translation; List<Translation>? get translations => _translations; List<String>? get locales => _locales; UserData? get seller => _seller; Dyn get subscription => _subscription; List<CategoryData>? get categories => _categories; Bonus? get bonus => _bonus; List<Discount>? get discount => _discount; List<ShopPayments>? get shopPayments => _shopPayments; List<ShopWorkingDays>? get shopWorkingDays => _shopWorkingDays; List<ShopTag>? get tags => _tags; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({String? to, String? from, String? type}) => DeliveryTime(to: to ?? _to, from: from ?? _from, type: type ?? _type); String? get to => _to; String? get from => _from; String? get type => _type; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ int? id, int? shopId, String? type, num? price, String? start, String? end, int? active, String? img, }) => Discount( id: id ?? _id, shopId: shopId ?? _shopId, type: type ?? _type, price: price ?? _price, start: start ?? _start, end: end ?? _end, active: active ?? _active, img: img ?? _img, ); int? get id => _id; int? get shopId => _shopId; String? get type => _type; num? get price => _price; String? get start => _start; String? get end => _end; int? get active => _active; String? get img => _img; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ String? bonusableType, int? bonusableId, int? bonusQuantity, int? bonusStockId, int? value, String? type, bool? status, String? expiredAt, BonusStock? bonusStock, }) => Bonus( bonusableType: bonusableType ?? _bonusableType, bonusableId: bonusableId ?? _bonusableId, bonusQuantity: bonusQuantity ?? _bonusQuantity, bonusStockId: bonusStockId ?? _bonusStockId, value: value ?? _value, type: type ?? _type, status: status ?? _status, expiredAt: expiredAt ?? _expiredAt, bonusStock: bonusStock ?? _bonusStock, ); String? get bonusableType => _bonusableType; int? get bonusableId => _bonusableId; int? get bonusQuantity => _bonusQuantity; int? get bonusStockId => _bonusStockId; int? get value => _value; String? get type => _type; bool? get status => _status; String? get expiredAt => _expiredAt; BonusStock? get bonusStock => _bonusStock; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ int? id, int? countableId, num? price, int? quantity, num? tax, num? totalPrice, ProductData? product, }) => BonusStock( id: id ?? _id, countableId: countableId ?? _countableId, price: price ?? _price, quantity: quantity ?? _quantity, tax: tax ?? _tax, totalPrice: totalPrice ?? _totalPrice, product: product ?? _product, ); int? get id => _id; int? get countableId => _countableId; num? get price => _price; int? get quantity => _quantity; num? get tax => _tax; num? get totalPrice => _totalPrice; ProductData? get product => _product; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ int? id, int? shopId, int? status, Dyn clientId, Dyn secretId, PaymentData? payment, }) => ShopPayments( id: id ?? _id, shopId: shopId ?? _shopId, status: status ?? _status, clientId: clientId ?? _clientId, secretId: secretId ?? _secretId, payment: payment ?? _payment, ); int? get id => _id; int? get shopId => _shopId; int? get status => _status; Dyn get clientId => _clientId; Dyn get secretId => _secretId; PaymentData? get payment => _payment; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ int? id, String? day, String? from, String? to, bool? disabled, }) => ShopWorkingDays( id: id ?? _id, day: day ?? _day, from: from ?? _from, to: to ?? _to, disabled: disabled ?? _disabled, ); int? get id => _id; String? get day => _day; String? get from => _from; String? get to => _to; bool? get disabled => _disabled; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ int? id, String? img, Translation? translation, List<String>? locales, }) => ShopTag( id: id ?? _id, img: img ?? _img, translation: translation ?? _translation, locales: locales ?? _locales, ); int? get id => _id; String? get img => _img; Translation? get translation => _translation; List<String>? get locales => _locales; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
