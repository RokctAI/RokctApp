class CountNotificationModel {
  int? notification;
  int? transaction;

  CountNotificationModel({this.notification, this.transaction});

  CountNotificationModel copyWith({int? notification, int? transaction}) =>
      CountNotificationModel(
        notification: notification ?? this.notification,
        transaction: transaction ?? this.transaction,
      );

  factory CountNotificationModel.fromJson(Map<String, Dyn> json) =>
      CountNotificationModel(
        notification: json["notification"],
        transaction: json["transaction"],
      );

  Map<String, Dyn> toJson() => {
    "notification": notification,
    "transaction": transaction,
  };
}

typedef Dyn = dynamic;
