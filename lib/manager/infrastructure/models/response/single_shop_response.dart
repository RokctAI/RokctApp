import 'package:rokctapp/manager/infrastructure/models/data/merchant_data.dart';

class SingleShopResponse {
  SingleShopResponse({MerchantData? data}) {
    _data = data;
  }

  SingleShopResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? MerchantData.fromJson(json['data']) : null;
  }

  MerchantData? _data;

  SingleShopResponse copyWith({MerchantData? data}) =>
      SingleShopResponse(data: data ?? _data);

  MerchantData? get data => _data;

  Map<String, Dyn> toJson() {
    final map = <String, Dyn>{};

    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

typedef Dyn = dynamic;
