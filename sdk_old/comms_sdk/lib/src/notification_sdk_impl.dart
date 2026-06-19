import 'package:core_sdk/core_sdk.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'notification_repository.dart';
import 'models/data/notification_models.dart';

class NotificationsSDK {
  final NotificationRepository _repository = NotificationRepository();

  Future<List<dynamic>> getNotifications({int? page}) async {
    final res = await _repository.getNotifications(page: page);
    return res.when(
      success: (response) => response.data ?? [],
      failure: (err, status) {
        throw Exception(err.toString());
      },
    );
  }

  Future<int> getUnreadCount() async {
    final res = await _repository.getCount();
    return res.when(
      success: (response) => response.notification ?? 0,
      failure: (err, status) => 0,
    );
  }

  Future<void> updateDeviceToken() async {
    try {
      final fcmToken = await FirebaseMessaging.instance.getToken() ?? "";
      if (fcmToken.isEmpty) return;

      final client = dioHttp.client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/user/device-token',
        data: {'device_token': fcmToken, 'provider': 'fcm'},
      );
    } catch (_) {
      // Fail silently to prevent push errors from crashing app boot
    }
  }

  NotificationRepository get repository => _repository;
}
