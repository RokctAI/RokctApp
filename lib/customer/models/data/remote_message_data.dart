class RemoteMessageData {
  final int? id;
  final String? s;
  final String? type;

  RemoteMessageData({this.id, this.s, this.type});

  factory RemoteMessageData.fromJson(Map data) {
    return RemoteMessageData(
      id: int.tryParse(data["id"]),
      status: data["s"],
      type: data["type"],
    );
  }
}
