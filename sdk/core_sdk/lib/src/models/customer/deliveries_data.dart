import 'package:delivery_sdk/delivery_sdk.dart';

class DeliveriesData {
  final int shopId;
  final List<MerchantDelivery> shopDeliveries;

  DeliveriesData(this.shopId, this.shopDeliveries);
}
