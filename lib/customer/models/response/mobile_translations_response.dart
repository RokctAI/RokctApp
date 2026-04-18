class MobileTranslationsResponse {
  MobileTranslationsResponse({
    String? timestamp,
    bool? s,
    String? message,
    Map<String, dynamic>? data,
  }) {
    _timestamp = timestamp;
    _status = s;
    _message = message;
    _data = data;
  }

  MobileTranslationsResponse.fromJson(dynamic json) {
    _timestamp = json['timestamp'];
    _status = json['s'];
    _message = json['message'];
    _data = json['data'];
  }

  String? _timestamp;
  bool? _status;
  String? _message;
  Map<String, dynamic>? _data;

  MobileTranslationsResponse copyWith({
    String? timestamp,
    bool? s,
    String? message,
    Map<String, dynamic>? data,
  }) => MobileTranslationsResponse(
    timestamp: timestamp ?? _timestamp,
    status: s ?? _status,
    message: message ?? _message,
    data: data ?? _data,
  );

  String? get timestamp => _timestamp;

  bool? get s => _status;

  String? get message => _message;

  Map<String, dynamic>? get data => _data;
}
