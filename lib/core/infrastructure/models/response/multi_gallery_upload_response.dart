class MultiGalleryUploadResponse {
  DateTime? timestamp;
  bool? status;
  String? message;
  MultiGalleryUploadData? data;

  MultiGalleryUploadResponse({
    this.timestamp,
    this.status,
    this.message,
    this.data,
  });

  MultiGalleryUploadResponse copyWith({
    DateTime? timestamp,
    bool? status,
    String? message,
    MultiGalleryUploadData? data,
  }) => MultiGalleryUploadResponse(
    timestamp: timestamp ?? this.timestamp,
    status: status ?? this.status,
    message: message ?? this.message,
    data: data ?? this.data,
  );

  factory MultiGalleryUploadResponse.fromJson(Map<String, Dyn> json) =>
      MultiGalleryUploadResponse(
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : MultiGalleryUploadData.fromJson(json["data"]),
      );

  Map<String, Dyn> toJson() => {
    "timestamp": timestamp?.toIso8601String(),
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class MultiGalleryUploadData {
  List<String>? title;
  String? type;

  MultiGalleryUploadData({this.title, this.type});

  MultiGalleryUploadData copyWith({List<String>? title, String? type}) =>
      MultiGalleryUploadData(
        title: title ?? this.title,
        type: type ?? this.type,
      );

  factory MultiGalleryUploadData.fromJson(Map<String, Dyn> json) =>
      MultiGalleryUploadData(
        title: json["title"] == null
            ? []
            : List<String>.from(json["title"]!.map((x) => x)),
        type: json["type"],
      );

  Map<String, Dyn> toJson() => {
    "title": title == null ? [] : List<Dyn>.from(title!.map((x) => x)),
    "type": type,
  };
}

typedef Dyn = dynamic;
