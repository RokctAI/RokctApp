import 'package:core_sdk/core_sdk.dart';
import 'package:core_sdk/core_sdk.dart';

class BannersRequest {
  final int page;
  final int perPage;

  BannersRequest({required this.page, this.perPage = 4});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
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

