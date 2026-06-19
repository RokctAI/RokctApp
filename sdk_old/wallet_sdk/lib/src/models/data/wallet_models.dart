class PaymentsResponse {
  final List<dynamic>? data;

  PaymentsResponse({this.data});

  factory PaymentsResponse.fromJson(dynamic json) {
    if (json == null) return PaymentsResponse();
    return PaymentsResponse(
      data: json['data'] is List ? json['data'] : null,
    );
  }
}

class TransactionsResponse {
  final dynamic data;

  TransactionsResponse({this.data});

  factory TransactionsResponse.fromJson(dynamic json) {
    if (json == null) return TransactionsResponse();
    return TransactionsResponse(
      data: json['data'],
    );
  }
}

class NonExistPaymentResponse {
  final List<dynamic>? data;

  NonExistPaymentResponse({this.data});

  factory NonExistPaymentResponse.fromJson(dynamic json) {
    if (json == null) return NonExistPaymentResponse();
    return NonExistPaymentResponse(
      data: json['data'] is List ? json['data'] : null,
    );
  }
}

class MaksekeskusResponse {
  final String? url;

  MaksekeskusResponse({this.url});

  factory MaksekeskusResponse.fromJson(dynamic json) {
    if (json == null) return MaksekeskusResponse();
    return MaksekeskusResponse(
      url: json['url'],
    );
  }
}
