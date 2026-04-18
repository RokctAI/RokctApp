import 'package:rokctapp/core/domain/handlers/handlers.dart';
import 'package:rokctapp/driver/infrastructure/models/models.dart';

abstract class NotificationRepositoryFacade {
  Future<ApiResult<NotificationResponse>> getNotifications({int? page});

  Future<ApiResult<NotificationResponse>> getAllNotifications();

  Future<ApiResult<dynamic>> readOne({int? id});

  Future<ApiResult<NotificationResponse>> readAll();

  Future<ApiResult<CountNotificationModel>> getCount();
}
