typedef Dyn = dynamic;
class DeliveryZoneData {
  int? id;
  List<List<double>>? address;

  DeliveryZoneData({this.id, this.address});

  DeliveryZoneData copyWith({int? id, List<List<double>>? address}) =>
      DeliveryZoneData(id: id ?? this.id, address: address ?? this.address);

  factory DeliveryZoneData.fromJson(Map<String, Dyn> json) =>
      DeliveryZoneData(
        id: json["id"],
        address: json["address"] == null
            ? []
            : List<List<double>>.from(
                json["address"]!.map(
                  (x) => List<double>.from(x.map((x) => x?.toDouble())),
                ),
              ),
      );

  Map<String, Dyn> toJson() => {
    "id": id,
    "address": address == null
        ? []
        : List<Dyn>.from(
            address!.map((x) => List<Dyn>.from(x.map((x) => x))),
          ),
  };
}
