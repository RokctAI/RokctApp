import 'dart:convert';

import 'package:rokctapp/manager/infrastructure/models/data/table_statistics_data.dart';

TableStatisticResponse tableStatisticResponseFromJson(String str) =>
    TableStatisticResponse.fromJson(json.decode(str));

String tableStatisticResponseToJson(TableStatisticResponse data) =>
    json.encode(data.toJson());

class TableStatisticResponse {
  DateTime timestamp;
  bool s;
  String message;
  TableStatisticData data;

  TableStatisticResponse({
    required this.timestamp,
    required this.s,
    required this.message,
    required this.data,
  });

  factory TableStatisticResponse.fromJson(Map<String, dynamic> json) =>
      TableStatisticResponse(
        timestamp: DateTime.parse(json["timestamp"]),
        status: json["s"],
        message: json["message"],
        data: TableStatisticData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp.toIso8601String(),
    "s": s,
    "message": message,
    "data": data.toJson(),
  };
}
