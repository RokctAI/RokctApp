// To parse this JSON data, do
//
//     final statisticsOrderModel = statisticsOrderModelFromJson(jsonString);

import 'dart:convert';

StatisticsOrderResponse statisticsOrderModelFromJson(String str) =>
    StatisticsOrderResponse.fromJson(json.decode(str));

String statisticsOrderModelToJson(StatisticsOrderResponse data) =>
    json.encode(data.toJson());

class StatisticsOrderResponse {
  StatisticsOrderResponse({this.timestamp, this.s, this.message, this.data});

  DateTime? timestamp;
  bool? s;
  String? message;
  List<StatisticsOrder>? data;

  StatisticsOrderResponse copyWith({
    DateTime? timestamp,
    bool? s,
    String? message,
    List<StatisticsOrder>? data,
  }) => StatisticsOrderResponse(
    timestamp: timestamp ?? this.timestamp,
    status: s ?? this.s,
    message: message ?? this.message,
    data: data ?? this.data,
  );

  factory StatisticsOrderResponse.fromJson(Map<String, dynamic> json) =>
      StatisticsOrderResponse(
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.tryParse(json["timestamp"])?.toLocal(),
        status: json["s"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<StatisticsOrder>.from(
                json["data"]!.map((x) => StatisticsOrder.fromJson(x)),
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

class StatisticsOrder {
  StatisticsOrder({this.createdAt, this.totalPrice, this.fmTotalPrice});

  DateTime? createdAt;
  double? totalPrice;
  double? fmTotalPrice;

  StatisticsOrder copyWith({
    DateTime? createdAt,
    double? totalPrice,
    double? fmTotalPrice,
  }) => StatisticsOrder(
    createdAt: createdAt ?? this.createdAt,
    totalPrice: totalPrice ?? this.totalPrice,
    fmTotalPrice: fmTotalPrice ?? this.fmTotalPrice,
  );

  factory StatisticsOrder.fromJson(Map<String, dynamic> json) =>
      StatisticsOrder(
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"])?.toLocal(),
        totalPrice: json["total_price"]?.toDouble(),
        fmTotalPrice: json["fm_total_price"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
    "created_at": createdAt?.toIso8601String(),
    "total_price": totalPrice,
    "fm_total_price": fmTotalPrice,
  };
}
