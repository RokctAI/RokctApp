import 'package:rokctapp/manager/infrastructure/models/data/table_data.dart';

class TableResponse {
  String? timestamp;
  bool? s;
  String? message;
  List<TableData>? data;

  TableResponse({this.timestamp, this.s, this.message, this.data});

  TableResponse.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    s = json['s'];
    message = json['message'];
    data = List<TableData>.from(json["data"].map((x) => TableData.fromJson(x)));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['s'] = s;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = List<dynamic>.from(this.data!.map((x) => x.toJson()));
    }
    return data;
  }
}
