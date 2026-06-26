import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';
import 'package:comms_sdk/comms_sdk.dart';

final notificationProvider =
    StateNotifierProvider<NotificationNotifier, NotificationState>(
      (ref) => NotificationNotifier(managerNotificationRepository),
    );
