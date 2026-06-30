import 'package:core_sdk/src/models/data/merchant_delivery.dart';

class MerchantDeliveriesResponse {
  MerchantDeliveriesResponse({List<MerchantDelivery>? data}) {
    _data = data;
  }

  MerchantDeliveriesResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(MerchantDelivery.fromJson(v));
      });
    }
  }

  List<MerchantDelivery>? _data;

  MerchantDeliveriesResponse copyWith({List<MerchantDelivery>? data}) =>
      MerchantDeliveriesResponse(data: data ?? _data);

  List<MerchantDelivery>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}


