import 'package:rokctapp/manager/infrastructure/models/data/table_data.dart';

class MerchantSectionResponse {
  List<MerchantSection>? data;

  MerchantSectionResponse({this.data});

  MerchantSectionResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <MerchantSection>[];
      json['data'].forEach((v) {
        data!.add(MerchantSection.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

