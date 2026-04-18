class DeliveryZonePaginate {
  DateTime? timestamp;
  bool? s;
  String? message;
  List<List<double>>? data;

  DeliveryZonePaginate({this.timestamp, this.s, this.message, this.data});

  DeliveryZonePaginate copyWith({
    DateTime? timestamp,
    bool? s,
    String? message,
    List<List<double>>? data,
  }) => DeliveryZonePaginate(
    timestamp: timestamp ?? this.timestamp,
    status: s ?? this.s,
    message: message ?? this.message,
    data: data ?? this.data,
  );

  factory DeliveryZonePaginate.fromJson(Map<String, dynamic> json) =>
      DeliveryZonePaginate(
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
        status: json["s"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<List<double>>.from(
                json["data"]!.map(
                  (x) => List<double>.from(x.map((x) => x?.toDouble())),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp?.toIso8601String(),
    "s": s,
    "message": message,
    "data": data == null
        ? []
        : List<dynamic>.from(
            data!.map((x) => List<dynamic>.from(x.map((x) => x))),
          ),
  };
}
