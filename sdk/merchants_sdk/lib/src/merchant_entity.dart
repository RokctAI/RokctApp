enum MerchantType { shop, restaurant, company, loanprovider, tenant }

abstract class MerchantEntity {
  String? get id;
  String? get uuid;
  String? get title;
  String? get logoUrl;
  String? get bannerUrl;
  bool? get isActive;
  MerchantType get type;
}
