# API Reference: order_body_data

Source file: `lib/customer/models/data/order_body_data.dart`

## Classes

### class `OrderBodyData`

### class `AddressModel`

### class `ProductOrder`

## Whitelisted API Endpoints

### `toJson({String? paymentTag})`
*No documentation provided (generation failed).*

### `toJson()`
*No documentation provided (generation failed).*

### `AddressModel(address: data?["address"], office: data?["office"], house: data?["house"], floor: data?["floor"], ); } } class ShopOrder { final int shopId; final int? deliveryAddressId; final num? deliveryFee; final int? deliveryTypeId; final String? coupon; final String? deliveryDate; final String? deliveryTime; final num tax; final List<ProductOrder> products; ShopOrder({ required this.shopId, this.deliveryFee, this.deliveryTypeId, this.deliveryAddressId, this.coupon, this.deliveryDate, this.deliveryTime, required this.tax, required this.products, }); @override String toString()`
*No documentation provided (generation failed).*

### `toString()`
*No documentation provided (generation failed).*
