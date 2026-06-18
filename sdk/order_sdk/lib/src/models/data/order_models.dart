class OrderResponse {
  final List<dynamic>? data;

  OrderResponse({this.data});

  factory OrderResponse.fromJson(dynamic json) {
    if (json == null) return OrderResponse();
    return OrderResponse(
      data: json['data'] is List ? json['data'] : null,
    );
  }
}

class ProductResponse {
  final List<dynamic>? data;

  ProductResponse({this.data});

  factory ProductResponse.fromJson(dynamic json) {
    if (json == null) return ProductResponse();
    return ProductResponse(
      data: json['data'] is List ? json['data'] : null,
    );
  }
}

class ShopResponse {
  final List<dynamic>? data;

  ShopResponse({this.data});

  factory ShopResponse.fromJson(dynamic json) {
    if (json == null) return ShopResponse();
    return ShopResponse(
      data: json['data'] is List ? json['data'] : null,
    );
  }
}
