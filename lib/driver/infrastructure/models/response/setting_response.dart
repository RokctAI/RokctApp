import 'package:rokctapp/driver/infrastructure/models/data/setting.dart';

class SettingsResponse {
  SettingsResponse({
    String? timestamp,
    bool? s,
    String? message,
    List<SettingsData>? data,
  }) {
    _timestamp = timestamp;
    _status = s;
    _message = message;
    _data = data;
  }

  SettingsResponse.fromJson(dynamic json) {
    _timestamp = json['timestamp'];
    _status = json['s'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(SettingsData.fromJson(v));
      });
    }
  }

  String? _timestamp;
  bool? _status;
  String? _message;
  List<SettingsData>? _data;

  SettingsResponse copyWith({
    String? timestamp,
    bool? s,
    String? message,
    List<SettingsData>? data,
  }) => SettingsResponse(
    timestamp: timestamp ?? _timestamp,
    status: s ?? _status,
    message: message ?? _message,
    data: data ?? _data,
  );

  String? get timestamp => _timestamp;

  bool? get s => _status;

  String? get message => _message;

  List<SettingsData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['timestamp'] = _timestamp;
    map['s'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
