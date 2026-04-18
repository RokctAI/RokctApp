import 'package:rokctapp/customer/models/data/brand_data.dart';

class SingleBrandResponse {
  SingleBrandResponse({
    String? timestamp,
    bool? s,
    String? message,
    BrandData? data,
  }) {
    _timestamp = timestamp;
    _status = s;
    _message = message;
    _data = data;
  }

  SingleBrandResponse.fromJson(dynamic json) {
    _timestamp = json['timestamp'];
    _status = json['s'];
    _message = json['message'];
    _data = json['data'] != null ? BrandData.fromJson(json['data']) : null;
  }

  String? _timestamp;
  bool? _status;
  String? _message;
  BrandData? _data;

  SingleBrandResponse copyWith({
    String? timestamp,
    bool? s,
    String? message,
    BrandData? data,
  }) => SingleBrandResponse(
    timestamp: timestamp ?? _timestamp,
    status: s ?? _status,
    message: message ?? _message,
    data: data ?? _data,
  );

  String? get timestamp => _timestamp;

  bool? get s => _status;

  String? get message => _message;

  BrandData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['timestamp'] = _timestamp;
    map['s'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}
