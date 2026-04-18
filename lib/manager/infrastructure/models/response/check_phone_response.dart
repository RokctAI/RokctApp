import 'dart:convert';

CheckPhoneResponse checkPhoneResponseFromJson(String str) =>
    CheckPhoneResponse.fromJson(json.decode(str));

String checkPhoneResponseToJson(CheckPhoneResponse data) =>
    json.encode(data.toJson());

class CheckPhoneResponse {
  DateTime? timestamp;
  bool? s;
  String? message;
  CheckPhoneData? data;

  CheckPhoneResponse({this.timestamp, this.s, this.message, this.data});

  CheckPhoneResponse copyWith({
    DateTime? timestamp,
    bool? s,
    String? message,
    CheckPhoneData? data,
  }) => CheckPhoneResponse(
    timestamp: timestamp ?? this.timestamp,
    status: s ?? this.s,
    message: message ?? this.message,
    data: data ?? this.data,
  );

  factory CheckPhoneResponse.fromJson(Map<String, dynamic> json) =>
      CheckPhoneResponse(
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
        status: json["s"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : CheckPhoneData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp?.toIso8601String(),
    "s": s,
    "message": message,
    "data": data?.toJson(),
  };
}

class CheckPhoneData {
  bool? exist;

  CheckPhoneData({this.exist});

  CheckPhoneData copyWith({bool? exist}) =>
      CheckPhoneData(exist: exist ?? this.exist);

  factory CheckPhoneData.fromJson(Map<String, dynamic> json) =>
      CheckPhoneData(exist: json["exist"]);

  Map<String, dynamic> toJson() => {"exist": exist};
}
