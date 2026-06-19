import 'package:rokctapp/manager/infrastructure/models/data/table_data.dart';

class ShopSectionResponse {
  List<ShopSection>? data;

  ShopSectionResponse({this.data});

  ShopSectionResponse.fromJson(Map<String, Dyn> json) {
    if (json['data'] != null) {
      data = <ShopSection>[];
      json['data'].forEach((v) {
        data!.add(ShopSection.fromJson(v));
      });
    }
  }

  Map<String, Dyn> toJson() {
    final Map<String, Dyn> data = <String, Dyn>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

typedef Dyn = dynamic;
