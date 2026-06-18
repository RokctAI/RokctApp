class Meta {
  Meta({int? total}) {
    _total = total;
  }

  Meta.fromJson(dynamic json) {
    _total = json['total'];
  }

  int? _total;

  Meta copyWith({int? total}) => Meta(total: total ?? _total);

  int? get total => _total;

  Map<String, Dyn> toJson() {
    final map = <String, Dyn>{};
    map['total'] = _total;
    return map;
  }
}

typedef Dyn = dynamic;
