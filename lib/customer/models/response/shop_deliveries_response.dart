typedef Dyn = dynamic;
import 'package:rokctapp/customer/models/data/shop_delivery.dart';

class ShopDeliveriesResponse {
  ShopDeliveriesResponse({List<ShopDelivery>? data}) {
    _data = data;
  }

  ShopDeliveriesResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(ShopDelivery.fromJson(v));
      });
    }
  }

  List<ShopDelivery>? _data;

  ShopDeliveriesResponse copyWith({List<ShopDelivery>? data}) =>
      ShopDeliveriesResponse(data: data ?? _data);

  List<ShopDelivery>? get data => _data;

  Map<String, Dyn> toJson() {
    final map = <String, Dyn>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
