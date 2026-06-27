import 'package:rokctapp/core/infrastructure/utils/services.dart';

class OnlyShopRequest {
  final String? lan;
  OnlyShopRequest({this.lan});

  Map<String, Dyn> toJson() {
    final map = <String, Dyn>{};
    map["lang"] = LocalStorage.getLanguage()?.locale ?? "en";
    if (LocalStorage.getSelectedCurrency() != null) {
      map["currency_id"] = LocalStorage.getSelectedCurrency()?.id;
    }
    return map;
  }
}

typedef Dyn = dynamic;
