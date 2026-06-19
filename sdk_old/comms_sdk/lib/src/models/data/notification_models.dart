class NotificationResponse {
  final List<dynamic>? data;

  NotificationResponse({this.data});

  factory NotificationResponse.fromJson(dynamic json) {
    if (json == null) return NotificationResponse();
    return NotificationResponse(
      data: json['data'] is List ? json['data'] : null,
    );
  }
}

class CountNotificationModel {
  final int? notification;

  CountNotificationModel({this.notification});

  factory CountNotificationModel.fromJson(dynamic json) {
    if (json == null) return CountNotificationModel();
    return CountNotificationModel(
      notification: json['notification'] is int ? json['notification'] : 0,
    );
  }
}
