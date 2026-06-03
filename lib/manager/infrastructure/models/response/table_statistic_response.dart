typedef Dyn = dynamic;
import 'dart:convert';

import 'package:rokctapp/manager/infrastructure/models/data/table_statistics_data.dart';

TableStatisticResponse tableStatisticResponseFromJson(String str) =>
    TableStatisticResponse.fromJson(json.decode(str));

String tableStatisticResponseToJson(TableStatisticResponse data) =>
    json.encode(data.toJson());

class TableStatisticResponse {
  DateTime timestamp;
  bool status;
  String message;
  TableStatisticData data;

  TableStatisticResponse({
    required this.timestamp,
    required this.status,
    required this.message,
    required this.data,
  });

  factory TableStatisticResponse.fromJson(Map<String, Dyn> json) =>
      TableStatisticResponse(
        timestamp: DateTime.parse(json["timestamp"]),
        status: json["status"],
        message: json["message"],
        data: TableStatisticData.fromJson(json["data"]),
      );

  Map<String, Dyn> toJson() => {
    "timestamp": timestamp.toIso8601String(),
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}
