import 'package:rokctapp/manager/infrastructure/models/data/non_exist_payment.dart';

class NonExistPaymentResponse {
  DateTime? timestamp;
  bool? s;
  String? message;
  List<NonExistPayment>? data;

  NonExistPaymentResponse({
    this.timestamp,
    this.s,
    this.message,
    this.data,
  });

  NonExistPaymentResponse copyWith({
    DateTime? timestamp,
    bool? s,
    String? message,
    List<NonExistPayment>? data,
  }) => NonExistPaymentResponse(
    timestamp: timestamp ?? this.timestamp,
    status: s ?? this.s,
    message: message ?? this.message,
    data: data ?? this.data,
  );

  factory NonExistPaymentResponse.fromJson(Map<String, dynamic> json) =>
      NonExistPaymentResponse(
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
        status: json["s"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<NonExistPayment>.from(
                json["data"]!.map((x) => NonExistPayment.fromJson(x)),
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
