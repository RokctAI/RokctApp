# API Reference: product_data

Source file: `lib/customer/models/data/product_data.dart`

## Classes

### class `ProductData`

### class `Unit`

### class `Brand`

### class `Category`

### class `Stocks`

### class `Extras`

### class `Group`

### class `Properties`

### class `DiscountData`

## Whitelisted API Endpoints

### `copyWith({ int? id, String? uuid, int? shopId, int? categoryId, String? keywords, int? brandId, num? tax, num? interval, int? minQty, int? maxQty, bool? active, String? img, String? createdAt, String? updatedAt, num? ratingAvg, Dyn ordersCount, Translation? translation, List<Properties>? properties, List<Stocks>? stocks, ShopData? shop, Stocks? stock, Category? category, Brand? brand, Unit? unit, List<ReviewData>? reviews, List<Galleries>? galleries, }) => ProductData( id: id ?? _id, uuid: uuid ?? _uuid, stock: stock ?? _stock, shopId: shopId ?? _shopId, categoryId: categoryId ?? _categoryId, keywords: keywords ?? _keywords, brandId: brandId ?? _brandId, tax: tax ?? _tax, interval: interval ?? _interval, minQty: minQty ?? _minQty, maxQty: maxQty ?? _maxQty, active: active ?? _active, img: img ?? _img, createdAt: createdAt ?? _createdAt, updatedAt: updatedAt ?? _updatedAt, ratingAvg: ratingAvg ?? _ratingAvg, ordersCount: ordersCount ?? _ordersCount, translation: translation ?? _translation, properties: properties ?? _properties, stocks: stocks ?? _stocks, shop: shop ?? _shop, category: category ?? _category, brand: brand ?? _brand, unit: unit ?? _unit, reviews: reviews ?? _reviews, galleries: galleries ?? _galleries, ); int? get id => _id; String? get uuid => _uuid; int? get shopId => _shopId; int? get categoryId => _categoryId; String? get keywords => _keywords; int? get brandId => _brandId; num? get tax => _tax; num? get interval => _interval; int? get minQty => _minQty; int? get maxQty => _maxQty; bool? get active => _active; String? get img => _img; String? get createdAt => _createdAt; String? get updatedAt => _updatedAt; num? get ratingAvg => _ratingAvg; Dyn get ordersCount => _ordersCount; Translation? get translation => _translation; Stocks? get stock => _stock; List<Properties>? get properties => _properties; List<Stocks>? get stocks => _stocks; List<DiscountData>? get discounts => _discounts; ShopData? get shop => _shop; Category? get category => _category; Brand? get brand => _brand; Unit? get unit => _unit; int? get count => _count; List<ReviewData>? get reviews => _reviews; List<Galleries>? get galleries => _galleries; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ int? id, bool? active, String? position, String? createdAt, String? updatedAt, Translation? translation, }) => Unit( id: id ?? _id, active: active ?? _active, position: position ?? _position, createdAt: createdAt ?? _createdAt, updatedAt: updatedAt ?? _updatedAt, translation: translation ?? _translation, ); int? get id => _id; bool? get active => _active; String? get position => _position; String? get createdAt => _createdAt; String? get updatedAt => _updatedAt; Translation? get translation => _translation; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({int? id, String? uuid, String? title}) => Brand(id: id ?? _id, uuid: uuid ?? _uuid, title: title ?? _title); int? get id => _id; String? get uuid => _uuid; String? get title => _title; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ int? id, String? uuid, int? parentId, Translation? translation, }) => Category( id: id ?? _id, uuid: uuid ?? _uuid, parentId: parentId ?? _parentId, translation: translation ?? _translation, ); int? get id => _id; String? get uuid => _uuid; int? get parentId => _parentId; Translation? get translation => _translation; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ int? id, int? countableId, num? price, int? quantity, num? discount, num? tax, BonusModel? bonus, num? totalPrice, List<Extras>? extras, List<Addons>? addons, ProductData? product, }) => Stocks( bonus: bonus ?? _bonus, id: id ?? _id, countableId: countableId ?? _countableId, price: price ?? _price, quantity: quantity ?? _quantity, discount: discount ?? _discount, tax: tax ?? _tax, totalPrice: totalPrice ?? _totalPrice, extras: extras ?? _extras, product: product ?? _product, addons: addons ?? _addons, ); int? get id => _id; int? get countableId => _countableId; num? get price => _price; int? get quantity => _quantity; num? get discount => _discount; num? get tax => _tax; num? get totalPrice => _totalPrice; BonusModel? get bonus => _bonus; List<Addons>? get addons => _addons; List<Extras>? get extras => _extras; ProductData? get product => _product; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ int? id, int? extraGroupId, String? value, bool? active, Group? group, }) => Extras( id: id ?? _id, extraGroupId: extraGroupId ?? _extraGroupId, value: value ?? _value, group: group ?? _group, ); int? get id => _id; int? get extraGroupId => _extraGroupId; String? get value => _value; bool? get active => _active; Group? get group => _group; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ int? id, String? type, bool? active, Translation? translation, }) => Group( id: id ?? _id, type: type ?? _type, active: active ?? _active, translation: translation ?? _translation, ); int? get id => _id; String? get type => _type; bool? get active => _active; Translation? get translation => _translation; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({String? locale, String? key, String? value}) => Properties( locale: locale ?? _locale, key: key ?? _key, value: value ?? _value, ); String? get locale => _locale; String? get key => _key; String? get value => _value; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
