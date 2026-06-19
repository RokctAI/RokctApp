import 'package:get_it/get_it.dart';
library comms_sdk;

export 'src/models/data/notification_models.dart';
export 'src/notification_repository.dart';
export 'src/notification_sdk_impl.dart';
export 'src/application/notification_provider.dart';
export 'src/application/notification_state.dart';
export 'src/application/chat/chat_provider.dart';
export 'src/application/chat/chat_state.dart';


// Domain Interfaces
export 'src/domain/interface/notification.dart';
export 'src/domain/interface/manager_notification.dart';
export 'src/domain/interface/driver_notification.dart';

export 'src/di/comms_di.dart';

// Global DI Getters
NotificationRepositoryFacade get notificationRepo => GetIt.instance.get<NotificationRepositoryFacade>();
driver_notif_int.DriverNotificationRepository get driverNotificationRepository => GetIt.instance.get<driver_notif_int.DriverNotificationRepository>();
NotificationInterface get managerNotificationRepository => GetIt.instance.get<NotificationInterface>();
