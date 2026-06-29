import 'package:core_sdk/core_sdk.dart';
import 'package:delivery_sdk/delivery_sdk.dart';

abstract class DriverNotificationRepository {
  Future<ApiResult<NotificationResponse>> getNotifications({int? page});

  Future<ApiResult<NotificationResponse>> getAllNotifications();

  Future<ApiResult<dynamic>> readOne({int? id});

  Future<ApiResult<NotificationResponse>> readAll();

  Future<ApiResult<CountNotificationModel>> getCount();
}

