# API Reference: product_calculate_response

Source file: `lib/core/infrastructure/models/response/product_calculate_response.dart`

## Classes

### class `ProductCalculateResponse`

### class `CalculatedData`

### class `CalculatedProduct`

## Whitelisted API Endpoints

### `copyWith({ String? timestamp, bool? status, String? message, CalculatedData? data, }) => ProductCalculateResponse( timestamp: timestamp ?? _timestamp, status: status ?? _status, message: message ?? _message, data: data ?? _data, ); String? get timestamp => _timestamp; bool? get status => _status; String? get message => _message; CalculatedData? get data => _data; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ List<CalculatedProduct>? products, num? productTax, num? productTotal, num? orderTax, num? orderTotal, }) => CalculatedData( products: products ?? _products, productTax: productTax ?? _productTax, productTotal: productTotal ?? _productTotal, orderTax: orderTax ?? _orderTax, orderTotal: orderTotal ?? _orderTotal, ); List<CalculatedProduct>? get products => _products; num? get productTax => _productTax; num? get productTotal => _productTotal; num? get orderTax => _orderTax; num? get orderTotal => _orderTotal; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ int? id, num? price, int? qty, num? tax, num? shopTax, num? discount, num? priceWithoutTax, num? totalPrice, }) => CalculatedProduct( id: id ?? _id, price: price ?? _price, qty: qty ?? _qty, tax: tax ?? _tax, shopTax: shopTax ?? _shopTax, discount: discount ?? _discount, priceWithoutTax: priceWithoutTax ?? _priceWithoutTax, totalPrice: totalPrice ?? _totalPrice, ); int? get id => _id; num? get price => _price; int? get qty => _qty; num? get tax => _tax; num? get shopTax => _shopTax; num? get discount => _discount; num? get priceWithoutTax => _priceWithoutTax; num? get totalPrice => _totalPrice; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
