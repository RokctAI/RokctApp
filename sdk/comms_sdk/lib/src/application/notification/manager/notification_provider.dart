import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:comms_sdk/comms_sdk.dart';

final notificationProvider =
    StateNotifierProvider<NotificationNotifier, NotificationState>(
      (ref) => NotificationNotifier(managerNotificationRepository),
    );
