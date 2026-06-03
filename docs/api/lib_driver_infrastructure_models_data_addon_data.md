# API Reference: addon_data

Source file: `lib/driver/infrastructure/models/data/addon_data.dart`

## Classes

### class `AddonData`

## Whitelisted API Endpoints

### `copyWith({ int? id, int? stockId, int? addonId, int? quantity, bool? active, num? totalPrice, Stock? stock, ProductData? product, }) => AddonData( id: id ?? _id, stockId: stockId ?? _stockId, addonId: addonId ?? _addonId, quantity: quantity ?? _quantity, totalPrice: totalPrice ?? _totalPrice, stock: stock ?? _stock, active: active ?? _active, product: product ?? _product, ); int? get id => _id; int? get stockId => _stockId; int? get addonId => _addonId; int? get quantity => _quantity; bool? get active => _active; set setActive(bool active) => _active = active; set setCount(int count) => _quantity = count; num? get totalPrice => _totalPrice; ProductData? get product => _product; Stock? get stock => _stock; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
