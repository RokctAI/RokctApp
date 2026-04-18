import 'package:rokctapp/customer/models/data/address_new_data.dart';

class SingleAddressResponse {
  SingleAddressResponse({
    String? timestamp,
    bool? s,
    String? message,
    AddressNewModel? data,
  }) {
    _timestamp = timestamp;
    _status = s;
    _message = message;
    _data = data;
  }

  SingleAddressResponse.fromJson(dynamic json) {
    _timestamp = json['timestamp'];
    _status = json['s'];
    _message = json['message'];
    _data = json['data'] != null
        ? AddressNewModel.fromJson(json['data'])
        : null;
  }

  String? _timestamp;
  bool? _status;
  String? _message;
  AddressNewModel? _data;

  SingleAddressResponse copyWith({
    String? timestamp,
    bool? s,
    String? message,
    AddressNewModel? data,
  }) => SingleAddressResponse(
    timestamp: timestamp ?? _timestamp,
    status: s ?? _status,
    message: message ?? _message,
    data: data ?? _data,
  );

  String? get timestamp => _timestamp;

  bool? get s => _status;

  String? get message => _message;

  AddressNewModel? get data => _data;

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
