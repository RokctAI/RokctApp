# API Reference: order_data

Source file: `lib/customer/models/data/order_data.dart`

## Classes

### class `OrderData`

### class `ShopOrderDetails`

### class `OrderStocks`

### class `DeliveryType`

### class `ProductNote`

## Whitelisted API Endpoints

### `copyWith({ int? id, int? userId, num? price, num? currencyPrice, num? rate, int? orderDetailsCount, String? createdAt, String? updatedAt, CurrencyData? currency, UserModel? user, List<ShopOrderDetails>? details, ReviewData? review, }) => OrderData( id: id ?? _id, userId: userId ?? _userId, price: price ?? _price, currencyPrice: currencyPrice ?? _currencyPrice, rate: rate ?? _rate, orderDetailsCount: orderDetailsCount ?? _orderDetailsCount, createdAt: createdAt ?? _createdAt, updatedAt: updatedAt ?? _updatedAt, currency: currency ?? _currency, user: user ?? _user, details: details ?? _details, review: review ?? _review, ); int? get id => _id; num? get userId => _userId; num? get price => _price; num? get currencyPrice => _currencyPrice; num? get rate => _rate; int? get orderDetailsCount => _orderDetailsCount; String? get createdAt => _createdAt; String? get updatedAt => _updatedAt; CurrencyData? get currency => _currency; UserModel? get user => _user; List<ShopOrderDetails>? get details => _details; ReviewData? get review => _review; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ int? id, int? shopId, num? deliveryFee, num? price, num? tax, String? status, String? deliveryDate, String? deliveryTime, String? createdAt, String? updatedAt, List<OrderStocks>? orderStocks, CouponData? coupon, Dyn deliveryman, DeliveryType? deliveryType, ShopData? shop, }) => ShopOrderDetails( id: id ?? _id, shopId: shopId ?? _shopId, deliveryFee: deliveryFee ?? _deliveryFee, price: price ?? _price, tax: tax ?? _tax, status: status ?? _status, deliveryDate: deliveryDate ?? _deliveryDate, deliveryTime: deliveryTime ?? _deliveryTime, createdAt: createdAt ?? _createdAt, updatedAt: updatedAt ?? _updatedAt, orderStocks: orderStocks ?? _orderStocks, coupon: coupon ?? _coupon, deliveryman: deliveryman ?? _deliveryman, deliveryType: deliveryType ?? _deliveryType, shop: shop ?? _shop, ); int? get id => _id; int? get shopId => _shopId; num? get deliveryFee => _deliveryFee; num? get price => _price; num? get tax => _tax; String? get status => _status; String? get deliveryDate => _deliveryDate; String? get deliveryTime => _deliveryTime; String? get createdAt => _createdAt; String? get updatedAt => _updatedAt; List<OrderStocks>? get orderStocks => _orderStocks; CouponData? get coupon => _coupon; Dyn get deliveryman => _deliveryman; DeliveryType? get deliveryType => _deliveryType; ShopData? get shop => _shop; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ int? id, int? stockId, num? originPrice, num? tax, num? discount, int? quantity, num? totalPrice, String? createdAt, String? updatedAt, Stocks? stock, }) => OrderStocks( id: id ?? _id, stockId: stockId ?? _stockId, originPrice: originPrice ?? _originPrice, tax: tax ?? _tax, discount: discount ?? _discount, quantity: quantity ?? _quantity, totalPrice: totalPrice ?? _totalPrice, createdAt: createdAt ?? _createdAt, updatedAt: updatedAt ?? _updatedAt, stock: stock ?? _stock, ); int? get id => _id; num? get stockId => _stockId; num? get originPrice => _originPrice; num? get tax => _tax; num? get discount => _discount; int? get quantity => _quantity; num? get totalPrice => _totalPrice; String? get createdAt => _createdAt; String? get updatedAt => _updatedAt; Stocks? get stock => _stock; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ int? id, int? shopId, String? type, int? price, List<String>? times, String? note, bool? active, String? createdAt, String? updatedAt, Translation? translation, }) => DeliveryType( id: id ?? _id, shopId: shopId ?? _shopId, type: type ?? _type, price: price ?? _price, times: times ?? _times, note: note ?? _note, active: active ?? _active, createdAt: createdAt ?? _createdAt, updatedAt: updatedAt ?? _updatedAt, translation: translation ?? _translation, ); int? get id => _id; int? get shopId => _shopId; String? get type => _type; int? get price => _price; List<String>? get times => _times; String? get note => _note; bool? get active => _active; String? get createdAt => _createdAt; String? get updatedAt => _updatedAt; Translation? get translation => _translation; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
