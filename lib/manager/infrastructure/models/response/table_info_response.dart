typedef Dyn = dynamic;
import 'package:rokctapp/manager/infrastructure/models/data/table_info_data.dart';

class TableInfoResponse {
  DateTime timestamp;
  bool status;
  String message;
  TableInfoData data;

  TableInfoResponse({
    required this.timestamp,
    required this.status,
    required this.message,
    required this.data,
  });

  factory TableInfoResponse.fromJson(Map<String, Dyn> json) =>
      TableInfoResponse(
        timestamp: DateTime.parse(json["timestamp"]),
        status: json["status"],
        message: json["message"],
        data: TableInfoData.fromJson(json["data"]),
      );

  Map<String, Dyn> toJson() => {
    "timestamp": timestamp.toIso8601String(),
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}
