# API Reference: stock

Source file: `lib/manager/infrastructure/models/data/stock.dart`

## Classes

### class `Stock`

### class `AddonData`

## Whitelisted API Endpoints

### `copyWith({ int? id, int? countableId, num? price, num? discount, int? quantity, int? cartCount, num? tax, bool? bonus, bool? shopBonus, num? totalPrice, ProductData? product, List<Extras>? extras, List<Group>? localGroups, bool isInitial = false, String? countableType, String? sku, Stock? stock, ProductData? countable, List<AddonData>? addons, List<AddonData>? localAddons, }) => Stock( id: id ?? _id, bonus: bonus ?? _bonus, countableId: countableId ?? _countableId, price: isInitial ? num.tryParse('') : (price ?? _price), discount: isInitial ? num.tryParse('') : (discount ?? _discount), quantity: isInitial ? int.tryParse('') : (quantity ?? _quantity), cartCount: cartCount ?? _cartCount, tax: tax ?? _tax, totalPrice: totalPrice ?? _totalPrice, product: product ?? _product, extras: extras ?? _extras, localGroups: localGroups ?? _localGroups, countableType: countableType ?? _countableType, stock: stock ?? _stock, countable: countable ?? _countable, addons: addons ?? _addons, localAddons: localAddons ?? _localAddons, shopBonus: shopBonus ?? _shopBonus, sku: sku ?? _sku, ); int? get id => _id; int? get countableId => _countableId; num? get price => _price; num? get discount => _discount; int? get quantity => _quantity; int? get cartCount => _cartCount; bool? get bonus => _bonus; bool? get shopBonus => _shopBonus; num? get tax => _tax; num? get totalPrice => _totalPrice; ProductData? get product => _product; List<Extras>? get extras => _extras; List<Group>? get localGroups => _localGroups; String? get countableType => _countableType; String? get sku => _sku; Stock? get stock => _stock; ProductData? get countable => _countable; List<AddonData>? get addons => _addons; List<AddonData>? get localAddons => _localAddons; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ int? id, int? stockId, int? addonId, int? quantity, bool? active, num? totalPrice, Stock? stock, ProductData? product, }) => AddonData( id: id ?? _id, stockId: stockId ?? _stockId, addonId: addonId ?? _addonId, quantity: quantity ?? _quantity, totalPrice: totalPrice ?? _totalPrice, stock: stock ?? _stock, active: active ?? _active, product: product ?? _product, ); int? get id => _id; int? get stockId => _stockId; int? get addonId => _addonId; int? get quantity => _quantity; bool? get active => _active; set setActive(bool active) => _active = active; set setCount(int count) => _quantity = count; num? get totalPrice => _totalPrice; ProductData? get product => _product; Stock? get stock => _stock; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
