import 'package:get_it/get_it.dart';
import '../../comms_sdk.dart';
import 'package:rokctapp/customer/repository/notification_repository.dart' as customer_notif_repo;
import 'package:rokctapp/driver/infrastructure/repositories/notification_repository.dart' as driver_notif_impl;
import 'package:rokctapp/manager/infrastructure/repositories/notification_repository.dart' as manager_notif_impl;

class CommsSdkDependencies {
  static void register(GetIt getIt) {
    getIt.registerSingleton<NotificationRepositoryFacade>(customer_notif_repo.NotificationRepository());
    getIt.registerSingleton<driver_notif_int.DriverNotificationRepository>(driver_notif_impl.NotificationRepositoryImpl());
    getIt.registerSingleton<NotificationInterface>(manager_notif_impl.NotificationRepository());
  }
}
