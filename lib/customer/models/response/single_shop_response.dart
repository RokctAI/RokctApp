import 'package:rokctapp/customer/models/data/merchant_data.dart';

class SingleShopResponse {
  SingleShopResponse({
    String? timestamp,
    bool? status,
    String? message,
    MerchantData? data,
  }) {
    _timestamp = timestamp;
    _status = status;
    _message = message;
    _data = data;
  }

  SingleShopResponse.fromJson(dynamic json) {
    _timestamp = json['timestamp'];
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? MerchantData.fromJson(json['data']) : null;
  }

  String? _timestamp;
  bool? _status;
  String? _message;
  MerchantData? _data;

  SingleShopResponse copyWith({
    String? timestamp,
    bool? status,
    String? message,
    MerchantData? data,
  }) => SingleShopResponse(
    timestamp: timestamp ?? _timestamp,
    status: status ?? _status,
    message: message ?? _message,
    data: data ?? _data,
  );

  String? get timestamp => _timestamp;

  bool? get status => _status;

  String? get message => _message;

  MerchantData? get data => _data;

  Map<String, Dyn> toJson() {
    final map = <String, Dyn>{};
    map['timestamp'] = _timestamp;
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

typedef Dyn = dynamic;
