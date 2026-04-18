import 'package:rokctapp/manager/infrastructure/models/data/maksekeskus_data.dart';

class MaksekeskusResponse {
  DateTime? timestamp;
  bool? s;
  String? message;
  MaksekeskusData? data;

  MaksekeskusResponse({this.timestamp, this.s, this.message, this.data});

  MaksekeskusResponse copyWith({
    DateTime? timestamp,
    bool? s,
    String? message,
    MaksekeskusData? data,
  }) => MaksekeskusResponse(
    timestamp: timestamp ?? this.timestamp,
    status: s ?? this.s,
    message: message ?? this.message,
    data: data ?? this.data,
  );

  factory MaksekeskusResponse.fromJson(Map<String, dynamic> json) =>
      MaksekeskusResponse(
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
        status: json["s"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : MaksekeskusData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp?.toIso8601String(),
    "s": s,
    "message": message,
    "data": data?.toJson(),
  };
}
