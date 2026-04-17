import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/application/notification/notification_notifier.dart';
import 'package:rokctapp/application/notification/notification_state.dart';

final notificationProvider =
    NotifierProvider<NotificationNotifier, NotificationState>(
      () => NotificationNotifier(),
    );
