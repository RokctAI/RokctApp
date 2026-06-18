class AddressesResponse {
  final List<dynamic>? data;

  AddressesResponse({this.data});

  factory AddressesResponse.fromJson(dynamic json) {
    if (json == null) return AddressesResponse();
    return AddressesResponse(
      data: json['data'] is List ? json['data'] : null,
    );
  }
}

class SingleAddressResponse {
  final dynamic data;

  SingleAddressResponse({this.data});

  factory SingleAddressResponse.fromJson(dynamic json) {
    if (json == null) return SingleAddressResponse();
    return SingleAddressResponse(
      data: json['data'],
    );
  }
}

class LocalAddressData {
  final String title;
  final String address;
  final double lat;
  final double lng;

  LocalAddressData({
    required this.title,
    required this.address,
    required this.lat,
    required this.lng,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'address': address,
      'location': '$lat,$lng',
    };
  }
}
