typedef Dyn = dynamic;
class Meta {
  Meta({num? total}) {
    _total = total;
  }

  Meta.fromJson(dynamic json) {
    _total = json['total'];
  }

  num? _total;

  Meta copyWith({num? total}) => Meta(total: total ?? _total);

  num? get total => _total;

  Map<String, Dyn> toJson() {
    final map = <String, Dyn>{};
    map['total'] = _total;
    return map;
  }
}
