// To parse this JSON data, do
//
//     final statisticsOrderModel = statisticsOrderModelFromJson(jsonString);

import 'dart:convert';

StatisticsOrderResponse statisticsOrderModelFromJson(String str) =>
    StatisticsOrderResponse.fromJson(json.decode(str));

String statisticsOrderModelToJson(StatisticsOrderResponse data) =>
    json.encode(data.toJson());

class StatisticsOrderResponse {
  StatisticsOrderResponse({
    this.timestamp,
    this.s,
    this.message,
    this.data,
  });

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
        data: json["data"]["data"] != null
            ? List<StatisticsOrder>.from(
                json["data"]["data"]!.map((x) => StatisticsOrder.fromJson(x)),
              )
            : [],
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
  int? id;
  String? s;
  String? firstname;
  String? lastname;
  int? active;
  int? quantity;
  double? price;
  List<String>? products;

  StatisticsOrder({
    this.id,
    this.s,
    this.firstname,
    this.lastname,
    this.active,
    this.quantity,
    this.price,
    this.products,
  });

  StatisticsOrder copyWith({
    int? id,
    String? s,
    String? firstname,
    String? lastname,
    int? active,
    int? quantity,
    double? price,
    List<String>? products,
  }) => StatisticsOrder(
    id: id ?? this.id,
    status: s ?? this.s,
    firstname: firstname ?? this.firstname,
    lastname: lastname ?? this.lastname,
    active: active ?? this.active,
    quantity: quantity ?? this.quantity,
    price: price ?? this.price,
    products: products ?? this.products,
  );

  factory StatisticsOrder.fromJson(Map<String, dynamic> json) =>
      StatisticsOrder(
        id: json["id"],
        status: json["s"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        active: json["active"],
        quantity: json["quantity"],
        price: json["price"]?.toDouble(),
        products: json["products"] == null
            ? []
            : List<String>.from(json["products"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "s": s,
    "firstname": firstname,
    "lastname": lastname,
    "active": active,
    "quantity": quantity,
    "price": price,
    "products": products == null
        ? []
        : List<dynamic>.from(products!.map((x) => x)),
  };
}
