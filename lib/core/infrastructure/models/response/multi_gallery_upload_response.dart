class MultiGalleryUploadResponse {
  DateTime? timestamp;
  bool? s;
  String? message;
  MultiGalleryUploadData? data;

  MultiGalleryUploadResponse({this.timestamp, this.s, this.message, this.data});

  MultiGalleryUploadResponse copyWith({
    DateTime? timestamp,
    bool? s,
    String? message,
    MultiGalleryUploadData? data,
  }) => MultiGalleryUploadResponse(
    timestamp: timestamp ?? this.timestamp,
    status: s ?? this.s,
    message: message ?? this.message,
    data: data ?? this.data,
  );

  factory MultiGalleryUploadResponse.fromJson(Map<String, dynamic> json) =>
      MultiGalleryUploadResponse(
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
        status: json["s"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : MultiGalleryUploadData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp?.toIso8601String(),
    "s": s,
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

  factory MultiGalleryUploadData.fromJson(Map<String, dynamic> json) =>
      MultiGalleryUploadData(
        title: json["title"] == null
            ? []
            : List<String>.from(json["title"]!.map((x) => x)),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
    "title": title == null ? [] : List<dynamic>.from(title!.map((x) => x)),
    "type": type,
  };
}
