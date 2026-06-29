import 'package:core_sdk/core_sdk.dart';

class OnlyMerchantRequest {
  final String? lan;
  OnlyMerchantRequest({this.lan});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["lang"] = LocalStorage.getLanguage()?.locale ?? "en";
    if (LocalStorage.getSelectedCurrency() != null) {
      map["currency_id"] = LocalStorage.getSelectedCurrency()?.id;
    }
    return map;
  }
}


