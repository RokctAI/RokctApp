class AiTranslationResponse {
  AiTranslationResponse({
    String? timestamp,
    bool? s,
    String? message,
    AiTranslationData? data,
  }) {
    _timestamp = timestamp;
    _status = s;
    _message = message;
    _data = data;
  }

  AiTranslationResponse.fromJson(dynamic json) {
    _timestamp = json['timestamp'];
    _status = json['s'];
    _message = json['message'];
    _data = json['data'] != null
        ? AiTranslationData.fromJson(json['data'])
        : null;
  }

  String? _timestamp;
  bool? _status;
  String? _message;
  AiTranslationData? _data;

  AiTranslationResponse copyWith({
    String? timestamp,
    bool? s,
    String? message,
    AiTranslationData? data,
  }) => AiTranslationResponse(
    timestamp: timestamp ?? _timestamp,
    status: s ?? _status,
    message: message ?? _message,
    data: data ?? _data,
  );

  String? get timestamp => _timestamp;

  bool? get s => _status;

  String? get message => _message;

  AiTranslationData? get data => _data;

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

class AiTranslationData {
  AiTranslationData({String? title, String? description}) {
    _title = title;
    _description = description;
  }

  AiTranslationData.fromJson(dynamic json) {
    _title = json['title'];
    _description = json['description'];
  }

  String? _title;
  String? _description;

  AiTranslationData copyWith({String? title, String? description}) =>
      AiTranslationData(
        title: title ?? _title,
        description: description ?? _description,
      );

  String? get title => _title;

  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['description'] = _description;
    return map;
  }
}
