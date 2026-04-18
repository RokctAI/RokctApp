class CashbackResponse {
  CashbackResponse({
    String? timestamp,
    bool? s,
    String? message,
    CashbackData? data,
  }) {
    _timestamp = timestamp;
    _status = s;
    _message = message;
    _data = data;
  }

  CashbackResponse.fromJson(dynamic json) {
    _timestamp = json['timestamp'];
    _status = json['s'];
    _message = json['message'];
    _data = json['data'] != null ? CashbackData.fromJson(json['data']) : null;
  }

  String? _timestamp;
  bool? _status;
  String? _message;
  CashbackData? _data;

  CashbackResponse copyWith({
    String? timestamp,
    bool? s,
    String? message,
    CashbackData? data,
  }) => CashbackResponse(
    timestamp: timestamp ?? _timestamp,
    status: s ?? _status,
    message: message ?? _message,
    data: data ?? _data,
  );

  String? get timestamp => _timestamp;

  bool? get s => _status;

  String? get message => _message;

  CashbackData? get data => _data;

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

class CashbackData {
  CashbackData({num? price}) {
    _price = price;
  }

  CashbackData.fromJson(dynamic json) {
    _price = json['price'];
  }

  num? _price;

  CashbackData copyWith({num? price}) => CashbackData(price: price ?? _price);

  num? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = _price;
    return map;
  }
}
