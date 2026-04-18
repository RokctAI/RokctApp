import 'package:rokctapp/manager/infrastructure/models/data/subscriptions_data.dart';

class SubscriptionResponse {
  DateTime? timestamp;
  bool? s;
  String? message;
  List<SubscriptionData>? data;

  SubscriptionResponse({this.timestamp, this.s, this.message, this.data});

  SubscriptionResponse copyWith({
    DateTime? timestamp,
    bool? s,
    String? message,
    List<SubscriptionData>? data,
  }) => SubscriptionResponse(
    timestamp: timestamp ?? this.timestamp,
    status: s ?? this.s,
    message: message ?? this.message,
    data: data ?? this.data,
  );

  factory SubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      SubscriptionResponse(
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
        status: json["s"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<SubscriptionData>.from(
                json["data"]!.map((x) => SubscriptionData.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp?.toIso8601String(),
    "s": s,
    "message": message,
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}
