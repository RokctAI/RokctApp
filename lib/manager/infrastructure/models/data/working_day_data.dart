typedef Dyn = dynamic;
class WorkingDayData {
  List<Date> dates;
  Shop shop;

  WorkingDayData({required this.dates, required this.shop});

  factory WorkingDayData.fromJson(Map<String, Dyn> json) => WorkingDayData(
    dates: List<Date>.from(json["dates"].map((x) => Date.fromJson(x))),
    shop: Shop.fromJson(json["shop"]),
  );

  Map<String, Dyn> toJson() => {
    "dates": List<Dyn>.from(dates.map((x) => x.toJson())),
    "shop": shop.toJson(),
  };
}

class Date {
  int id;
  String day;
  String from;
  String to;
  bool disabled;

  Date({
    required this.id,
    required this.day,
    required this.from,
    required this.to,
    required this.disabled,
  });

  factory Date.fromJson(Map<String, Dyn> json) => Date(
    id: json["id"],
    day: json["day"],
    from: json["from"],
    to: json["to"],
    disabled: json["disabled"],
  );

  Map<String, Dyn> toJson() => {
    "id": id,
    "day": day,
    "from": from,
    "to": to,
    "disabled": disabled,
  };
}

class Shop {
  int id;
  DateTime createdAt;
  DateTime updatedAt;

  Shop({required this.id, required this.createdAt, required this.updatedAt});

  factory Shop.fromJson(Map<String, Dyn> json) => Shop(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, Dyn> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
