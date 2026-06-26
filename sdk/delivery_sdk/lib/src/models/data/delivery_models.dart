class ParcelResponse {
  final List<dynamic>? data;

  ParcelResponse({this.data});

  factory ParcelResponse.fromJson(dynamic json) {
    if (json == null) return ParcelResponse();
    return ParcelResponse(
      data: json['data'] is List ? json['data'] : null,
    );
  }
}
