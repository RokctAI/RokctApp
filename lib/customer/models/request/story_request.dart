typedef Dyn = dynamic;
import 'package:rokctapp/core/infrastructure/utils/services.dart';

import 'package:rokctapp/core/infrastructure/constants/constants.dart';

class StoryRequest {
  final int page;

  StoryRequest({required this.page});

  Map<String, Dyn> toJson() {
    final map = <String, Dyn>{};
    map["page"] = page;
    map["perPage"] = 5;
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
