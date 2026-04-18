import 'package:rokctapp/core/infrastructure/utils/services.dart';

class SearchProductModel {
  final String text;
  final int page;
  SearchProductModel({required this.text, required this.page});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["search"] = text;
    map["perPage"] = 10;
    map["s"] = "published";
    map["page"] = page;
    map["lang"] = LocalStorage.getLanguage()?.locale ?? "en";
    return map;
  }
}
