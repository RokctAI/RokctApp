import 'package:rokctapp/manager/infrastructure/models/data/table_info_data.dart';

class TableInfoResponse {
  DateTime timestamp;
  bool s;
  String message;
  TableInfoData data;

  TableInfoResponse({
    required this.timestamp,
    required this.s,
    required this.message,
    required this.data,
  });

  factory TableInfoResponse.fromJson(Map<String, dynamic> json) =>
      TableInfoResponse(
        timestamp: DateTime.parse(json["timestamp"]),
        status: json["s"],
        message: json["message"],
        data: TableInfoData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp.toIso8601String(),
    "s": s,
    "message": message,
    "data": data.toJson(),
  };
}
