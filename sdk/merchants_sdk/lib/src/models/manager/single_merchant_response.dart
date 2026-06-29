import 'package:merchants_sdk/merchants_sdk.dart';

class SingleMerchantResponse {
  SingleMerchantResponse({MerchantData? data}) {
    _data = data;
  }

  SingleMerchantResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? MerchantData.fromJson(json['data']) : null;
  }

  MerchantData? _data;

  SingleMerchantResponse copyWith({MerchantData? data}) =>
      SingleMerchantResponse(data: data ?? _data);

  MerchantData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};

    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

