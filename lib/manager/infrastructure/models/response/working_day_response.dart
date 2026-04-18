import 'dart:convert';
import 'package:rokctapp/manager/infrastructure/models/data/working_day_data.dart';

WorkingDayResponse workingDayResponseFromJson(String str) =>
    WorkingDayResponse.fromJson(json.decode(str));

String workingDayResponseToJson(WorkingDayResponse data) =>
    json.encode(data.toJson());

class WorkingDayResponse {
  DateTime timestamp;
  bool s;
  String message;
  WorkingDayData data;

  WorkingDayResponse({
    required this.timestamp,
    required this.s,
    required this.message,
    required this.data,
  });

  factory WorkingDayResponse.fromJson(Map<String, dynamic> json) =>
      WorkingDayResponse(
        timestamp: DateTime.parse(json["timestamp"]),
        status: json["s"],
        message: json["message"],
        data: WorkingDayData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp.toIso8601String(),
    "s": s,
    "message": message,
    "data": data.toJson(),
  };
}
