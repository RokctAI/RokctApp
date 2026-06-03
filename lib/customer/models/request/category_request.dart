typedef Dyn = dynamic;
import 'package:rokctapp/core/infrastructure/utils/services.dart';

import 'package:rokctapp/core/infrastructure/constants/constants.dart';

class CategoryModel {
  final int page;

  CategoryModel({required this.page});

  Map<String, Dyn> toJson() {
    final map = <String, Dyn>{};
    map["lang"] = LocalStorage.getLanguage()?.locale ?? "en";
    map["page"] = page;
    map["type"] = "shop";
    map["column"] = "input";
    map["sort"] = "asc";
    map["perPage"] = 10;
    map["address"] = {
      "latitude":
          LocalStorage.getAddressSelected()?.location?.latitude ??
          AppConstants.demoLatitude,
      "longitude":
          LocalStorage.getAddressSelected()?.location?.longitude ??
          AppConstants.demoLongitude,
    };
    return map;
  }

  Map<String, Dyn> toJsonShop() {
    final map = <String, Dyn>{};
    map["lang"] = LocalStorage.getLanguage()?.locale ?? "en";
    map["perPage"] = 100;
    return map;
  }
}
