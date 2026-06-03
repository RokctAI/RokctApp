# API Reference: calculate_response

Source file: `lib/manager/infrastructure/models/response/calculate_response.dart`

## Classes

### class `CalculateResponse`

### class `NeedntData`

### class `CalculatedData`

## Whitelisted API Endpoints

### `copyWith({NeedntData? data}) => CalculateResponse(data: data ?? _data); NeedntData? get data => _data; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({CalculatedData? data}) => NeedntData(data: data ?? _data); CalculatedData? get data => _data; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ List<Stock>? stocks, num? totalTax, num? price, num? totalShopTax, num? totalPrice, num? totalDiscount, num? deliveryFee, num? rate, num? couponPrice, }) => CalculatedData( stocks: stocks ?? _stocks, totalTax: totalTax ?? _totalTax, price: price ?? _price, totalShopTax: totalShopTax ?? _totalShopTax, totalPrice: totalPrice ?? _totalPrice, totalDiscount: totalDiscount ?? _totalDiscount, deliveryFee: deliveryFee ?? _deliveryFee, rate: rate ?? _rate, couponPrice: couponPrice ?? _couponPrice, ); List<Stock>? get stocks => _stocks; num? get totalTax => _totalTax; num? get price => _price; num? get totalShopTax => _totalShopTax; num? get totalPrice => _totalPrice; num? get totalDiscount => _totalDiscount; num? get deliveryFee => _deliveryFee; num? get rate => _rate; num? get couponPrice => _couponPrice; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
