import 'package:rokctapp/core/infrastructure/constants/constants.dart';
import 'package:rokctapp/core/infrastructure/utils/services.dart';

class BannersRequest {
  final int page;
  final int perPage;

  BannersRequest({required this.page, this.perPage = 4});

  Map<String, Dyn> toJson() {
    final map = <String, Dyn>{};
    map["page"] = page;
    map["perPage"] = perPage;
    map["lang"] = LocalStorage.getLanguage()?.locale ?? "en";
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
}

typedef Dyn = dynamic;
