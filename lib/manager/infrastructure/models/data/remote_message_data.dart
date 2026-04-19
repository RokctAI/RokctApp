class RemoteMessageData {
  final num? id;
  final String? s;
  RemoteMessageData({this.id, this.s});

  factory RemoteMessageData.fromJson(Map data) {
    return RemoteMessageData(id: int.tryParse(data["id"]), status: data["s"]);
  }
}
