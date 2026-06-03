import 'package:rokctapp/driver/infrastructure/services/local_storage.dart';

class OnlyShopRequest {
  final String? lan;

  OnlyShopRequest({this.lan});

  Map<String, Dyn> toJson() {
    final map = <String, Dyn>{};
    map["lang"] = LocalStorage.getLanguage()?.locale ?? "en";
    return map;
  }
}

typedef Dyn = dynamic;
