typedef Dyn = dynamic;
class MobileTranslationsResponse {
  MobileTranslationsResponse({
    String? timestamp,
    bool? status,
    String? message,
    Map<String, Dyn>? data,
  }) {
    _timestamp = timestamp;
    _status = status;
    _message = message;
    _data = data;
  }

  MobileTranslationsResponse.fromJson(dynamic json) {
    _timestamp = json['timestamp'];
    _status = json['status'];
    _message = json['message'];
    _data = json['data'];
  }

  String? _timestamp;
  bool? _status;
  String? _message;
  Map<String, Dyn>? _data;

  MobileTranslationsResponse copyWith({
    String? timestamp,
    bool? status,
    String? message,
    Map<String, Dyn>? data,
  }) => MobileTranslationsResponse(
    timestamp: timestamp ?? _timestamp,
    status: status ?? _status,
    message: message ?? _message,
    data: data ?? _data,
  );

  String? get timestamp => _timestamp;

  bool? get status => _status;

  String? get message => _message;

  Map<String, Dyn>? get data => _data;
}
