typedef Dyn = dynamic;
import 'dart:convert';

HelpModel helpModelFromJson(String str) => HelpModel.fromJson(json.decode(str));

String helpModelToJson(HelpModel data) => json.encode(data.toJson());

class HelpModel {
  HelpModel({this.data});

  List<Datum>? data;

  factory HelpModel.fromJson(Map<String, Dyn> json) => HelpModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, Dyn> toJson() => {
    "data": List<Dyn>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.uuid,
    this.type,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.translation,
    this.locales,
  });

  int? id;
  String? uuid;
  String? type;
  bool? active;
  DateTime? createdAt;
  DateTime? updatedAt;
  HelpTranslation? translation;
  List<String>? locales;

  factory Datum.fromJson(Map<String, Dyn> json) => Datum(
    id: json["id"],
    uuid: json["uuid"],
    type: json["type"],
    active: json["active"],
    createdAt: DateTime.tryParse(json["created_at"])?.toLocal(),
    updatedAt: DateTime.tryParse(json["updated_at"])?.toLocal(),
    translation: json["translation"] != null
        ? HelpTranslation.fromJson(json["translation"])
        : null,
  );

  Map<String, Dyn> toJson() => {
    "id": id,
    "uuid": uuid,
    "type": type,
    "active": active,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "translation": translation?.toJson(),
    "locales": List<Dyn>.from(locales!.map((x) => x)),
  };
}

class HelpTranslation {
  HelpTranslation({this.id, this.locale, this.question, this.answer});

  int? id;
  String? locale;
  String? question;
  String? answer;

  factory HelpTranslation.fromJson(Map<String, Dyn> json) =>
      HelpTranslation(
        id: json["id"],
        locale: json["locale"],
        question: json["question"],
        answer: json["answer"],
      );

  Map<String, Dyn> toJson() => {
    "id": id,
    "locale": locale,
    "question": question,
    "answer": answer,
  };
}

class Links {
  Links({this.first, this.last, this.prev, this.next});

  String? first;
  String? last;
  Dyn prev;
  Dyn next;

  factory Links.fromJson(Map<String, Dyn> json) => Links(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, Dyn> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class Meta {
  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.links,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  int? currentPage;
  int? from;
  int? lastPage;
  List<Link>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  factory Meta.fromJson(Map<String, Dyn> json) => Meta(
    currentPage: json["current_page"],
    from: json["from"],
    lastPage: json["last_page"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    path: json["path"],
    perPage: json["per_page"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, Dyn> toJson() => {
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "links": List<Dyn>.from(links!.map((x) => x.toJson())),
    "path": path,
    "per_page": perPage,
    "to": to,
    "total": total,
  };
}

class Link {
  Link({this.url, this.label, this.active});

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, Dyn> json) => Link(
    url: json["url"] ?? "",
    label: json["label"],
    active: json["active"],
  );

  Map<String, Dyn> toJson() => {
    "url": url ?? "",
    "label": label,
    "active": active,
  };
}
