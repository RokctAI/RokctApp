

class DeliveryZonePaginate {
  DeliveryZonePaginate({List<DeliveryZoneData>? data}) {
    _data = data;
  }

  DeliveryZonePaginate.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(DeliveryZoneData.fromJson(v));
      });
    }
  }

  List<DeliveryZoneData>? _data;

  DeliveryZonePaginate copyWith({List<DeliveryZoneData>? data}) =>
      DeliveryZonePaginate(data: data ?? _data);

  List<DeliveryZoneData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class DeliveryZoneData {
  DeliveryZoneData({int? id, List<List<double>>? address, MerchantData? shop}) {
    _id = id;
    _address = address;
    _shop = shop;
  }

  DeliveryZoneData.fromJson(dynamic json) {
    final List<dynamic>? addresses = json['address'];
    final List<List<double>> parsedAddresses = [];
    if (addresses != null) {
      for (int i = 0; i < addresses.length; i++) {
        final List<dynamic> item = addresses[i];
        List<double> items = [];
        for (int j = 0; j < item.length; j++) {
          items.add(double.parse(item[j].toString()));
        }
        parsedAddresses.add(items);
      }
    }
    _id = json['id'];
    _address = parsedAddresses;
    _shop = json['shop'] != null ? Map<String, dynamic>.from(json['shop']) : null;
  }

  int? _id;
  List<List<double>>? _address;
  Map<String, dynamic>? _shop;

  DeliveryZoneData copyWith({
    int? id,
    List<List<double>>? address,
    Map<String, dynamic>? shop,
  }) => DeliveryZoneData(
    id: id ?? _id,
    address: address ?? _address,
    shop: shop ?? _shop,
  );

  int? get id => _id;

  List<List<double>>? get address => _address;

  Map<String, dynamic>? get shop => _shop;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['address'] = _address;
    if (_shop != null) {
      map['shop'] = _shop?.toJson();
    }
    return map;
  }
}


