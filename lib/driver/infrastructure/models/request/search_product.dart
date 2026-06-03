typedef Dyn = dynamic;
import 'package:rokctapp/driver/infrastructure/services/local_storage.dart';

class SearchProductModel {
  final String text;
  final int page;

  SearchProductModel({required this.text, required this.page});

  Map<String, Dyn> toJson() {
    final map = <String, Dyn>{};
    map["search"] = text;
    map["perPage"] = 10;
    map["page"] = page;
    map["lang"] = LocalStorage.getLanguage()?.locale ?? "en";
    return map;
  }
}
