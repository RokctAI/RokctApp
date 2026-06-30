import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:comms_sdk/src/infrastructure/services/notification_service.dart';

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});
