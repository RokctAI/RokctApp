import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:venderfoodyman/domain/di/dependency_manager.dart';
import 'package:rokctapp/manager/application/notification/notification_notifier.dart';
import 'package:rokctapp/manager/application/notification/notification_state.dart';

final notificationProvider =
    StateNotifierProvider<NotificationNotifier, NotificationState>(
      (ref) => NotificationNotifier(notificationRepository),
    );
