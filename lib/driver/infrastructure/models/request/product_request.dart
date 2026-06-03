import 'package:rokctapp/driver/infrastructure/services/local_storage.dart';

class ProductRequest {
  final String shopId;
  final int page;

  ProductRequest({required this.shopId, required this.page});

  Map<String, Dyn> toJson() {
    final map = <String, Dyn>{};
    map["shop_id"] = shopId;
    map["lang"] = LocalStorage.getLanguage()?.locale ?? "en";
    map["page"] = page;
    map["perPage"] = 10;
    return map;
  }
}

typedef Dyn = dynamic;
