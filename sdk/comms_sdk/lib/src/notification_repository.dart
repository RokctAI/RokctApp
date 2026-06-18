import 'package:flutter/material.dart';
import 'package:core_sdk/core_sdk.dart';
import 'models/data/notification_models.dart';

class NotificationRepository {
  Future<ApiResult<NotificationResponse>> getNotifications({int? page}) async {
    final data = {
      if (page != null) 'page': page,
      'column': 'created_at',
      'sort': 'desc',
      'perPage': 7,
      'lang': CoreLocalStorage.getLanguage()?.locale ?? 'en',
    };
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get('/api/v1/dashboard/notifications', queryParameters: data);
      return ApiResult.success(data: NotificationResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get notifications failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  Future<ApiResult<void>> readAll() async {
    try {
      final client = dioHttp.client(requireAuth: true);
      await client.post('/api/v1/dashboard/notifications/read-all');
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> read all notifications failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  Future<ApiResult<CountNotificationModel>> getCount() async {
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.get('/api/v1/dashboard/user/profile/notifications-statistic');
      return ApiResult.success(data: CountNotificationModel.fromJson(response.data));
    } catch (e) {
      debugPrint('==> get notification count failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }
}
