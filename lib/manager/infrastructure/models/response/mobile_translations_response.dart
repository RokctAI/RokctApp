typedef Dyn = dynamic;
class TranslationsResponse {
  TranslationsResponse({Map<String, Dyn>? data}) {
    _data = data;
  }

  TranslationsResponse.fromJson(dynamic json) {
    _data = json['data'];
  }

  Map<String, Dyn>? _data;

  TranslationsResponse copyWith({Map<String, Dyn>? data}) =>
      TranslationsResponse(data: data ?? _data);

  Map<String, Dyn>? get data => _data;
}
