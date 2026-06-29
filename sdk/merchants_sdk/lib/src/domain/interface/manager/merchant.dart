import 'package:core_sdk/core_sdk.dart';
import 'package:merchants_sdk/merchants_sdk.dart';

abstract class MerchantInterface {
  Future<ApiResult<void>> createShop({
    required double tax,
    required List<String> documents,
    required double deliveryTo,
    required double deliveryFrom,
    required String deliveryType,
    required String phone,
    required String name,
    required num category,
    required String description,
    required double startPrice,
    required double perKm,
    required AddressData address,
    String? logoImage,
    String? backgroundImage,
  });
}
