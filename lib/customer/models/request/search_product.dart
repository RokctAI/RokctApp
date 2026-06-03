import 'package:rokctapp/core/infrastructure/utils/services.dart';

class SearchProductModel {
  final String text;
  final int page;
  SearchProductModel({required this.text, required this.page});

  Map<String, Dyn> toJson() {
    final map = <String, Dyn>{};
    map["search"] = text;
    map["perPage"] = 10;
    map["status"] = "published";
    map["page"] = page;
    map["lang"] = LocalStorage.getLanguage()?.locale ?? "en";
    return map;
  }
}

typedef Dyn = dynamic;
