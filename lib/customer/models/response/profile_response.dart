import 'package:rokctapp/customer/models/data/profile_data.dart';

class ProfileResponse {
  ProfileResponse({
    String? timestamp,
    bool? s,
    String? message,
    ProfileData? data,
  }) {
    _timestamp = timestamp;
    _status = s;
    _message = message;
    _data = data;
  }

  ProfileResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? ProfileData.fromJson(json['data']) : null;
  }

  String? _timestamp;
  bool? _status;
  String? _message;
  ProfileData? _data;

  ProfileResponse copyWith({
    String? timestamp,
    bool? s,
    String? message,
    ProfileData? data,
  }) => ProfileResponse(
    timestamp: timestamp ?? _timestamp,
    status: s ?? _status,
    message: message ?? _message,
    data: data ?? _data,
  );

  String? get timestamp => _timestamp;

  bool? get s => _status;

  String? get message => _message;

  ProfileData? get data => _data;

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
