import 'package:rokctapp/customer/models/data/cart_product_data.dart';
import 'package:merchants_sdk/merchants_sdk.dart';

class MerchantTotalData {
  final MerchantData shopData;
  final double shopTax;
  final double onlyShopTax;
  final double discount;
  final double totalPrice;
  final List<CartProductData> cartProducts;

  MerchantTotalData(
    this.shopData, {
    required this.shopTax,
    required this.onlyShopTax,
    required this.discount,
    required this.totalPrice,
    required this.cartProducts,
  });
}
