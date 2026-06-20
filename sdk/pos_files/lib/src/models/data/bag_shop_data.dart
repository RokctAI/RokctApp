import 'bag_data.dart';
import 'merchant_data.dart';

class BagShopData {
  final MerchantData shopData;
  final List<BagProductData> bagProducts;

  BagShopData({required this.shopData, required this.bagProducts});
}
