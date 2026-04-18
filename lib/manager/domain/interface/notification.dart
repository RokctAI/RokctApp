import 'package:rokctapp/manager/domain/handlers/api_result.dart';
import 'package:rokctapp/manager/infrastructure/models/models.dart';

abstract class NotificationInterface {
  Future<ApiResult<NotificationResponse>> getNotifications({int? page});

  Future<ApiResult<NotificationResponse>> getAllNotifications();

  Future<ApiResult<dynamic>> readOne({int? id});

  Future<ApiResult<NotificationResponse>> readAll();

  Future<ApiResult<CountNotificationModel>> getCount();
}
