# API Reference: product_data

Source file: `lib/manager/infrastructure/models/data/product_data.dart`

## Classes

### class `ProductData`

### class `ProductDiscounts`

### class `ProductPivot`

## Whitelisted API Endpoints

### `copyWith({ int? id, int? cartCount, List<Galleries>? galleries, String? uuid, int? shopId, int? categoryId, num? tax, num? interval, String? barCode, String? status, String? type, bool? active, bool? addon, String? img, int? minQty, int? maxQty, List<String>? locales, Translation? translation, CategoryData? category, UnitData? unit, List<Stock>? stocks, List<Translation>? translations, Stock? stock, int? unitId, List<ProductDiscounts>? discounts, bool? isSelectedAddon, }) => ProductData( id: id ?? _id, cartCount: cartCount ?? _cartCount, uuid: uuid ?? _uuid, shopId: shopId ?? _shopId, categoryId: categoryId ?? _categoryId, tax: tax ?? _tax, galleries: galleries ?? galleries, interval: interval ?? _interval, barCode: barCode ?? _barCode, status: status ?? _status, type: type ?? _type, active: active ?? _active, addon: addon ?? _addon, translations: translations ?? _translations, img: img ?? _img, minQty: minQty ?? _minQty, maxQty: maxQty ?? _maxQty, locales: locales ?? _locales, translation: translation ?? _translation, category: category ?? _category, unit: unit ?? _unit, stocks: stocks ?? _stocks, stock: stock ?? _stock, unitId: unitId ?? _unitId, discounts: discounts ?? _discounts, isSelectedAddon: isSelectedAddon ?? _isSelectedAddon, ); int? get id => _id; int? get cartCount => _cartCount; String? get uuid => _uuid; int? get shopId => _shopId; List<Galleries>? get galleries => _galleries; List<Translation>? get translations => _translations; int? get categoryId => _categoryId; num? get tax => _tax; num? get interval => _interval; String? get barCode => _barCode; String? get status => _status; String? get type => _type; bool? get active => _active; bool? get addon => _addon; String? get img => _img; int? get minQty => _minQty; int? get maxQty => _maxQty; List<String>? get locales => _locales; Translation? get translation => _translation; CategoryData? get category => _category; UnitData? get unit => _unit; KitchenModel? get kitchen => _kitchen; List<Stock>? get stocks => _stocks; Stock? get stock => _stock; int? get unitId => _unitId; List<ProductDiscounts>? get discounts => _discounts; bool? get isSelectedAddon => _isSelectedAddon; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ int? id, int? shopId, String? type, num? price, String? start, String? end, String? img, int? active, ProductPivot? pivot, }) => ProductDiscounts( id: id ?? _id, shopId: shopId ?? _shopId, type: type ?? _type, price: price ?? _price, start: start ?? _start, end: end ?? _end, img: img ?? _img, active: active ?? _active, pivot: pivot ?? _pivot, ); int? get id => _id; int? get shopId => _shopId; String? get type => _type; num? get price => _price; String? get start => _start; String? get end => _end; String? get img => _img; int? get active => _active; ProductPivot? get pivot => _pivot; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({int? productId, int? discountId}) => ProductPivot( productId: productId ?? _productId, discountId: discountId ?? _discountId, ); int? get productId => _productId; int? get discountId => _discountId; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
