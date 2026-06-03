# API Reference: notification_notifier

Source file: `lib/manager/application/notification/notification_notifier.dart`

## Classes

### class `NotificationNotifier`

## Whitelisted API Endpoints

### `NotificationState()); Future<void> fetchAllNotifications(BuildContext context) async { state = state.copyWith(isAllNotificationsLoading: true); final response = await _notificationRepository.getNotifications(); response.when( success: (data)`
*No documentation provided (generation failed).*

### `fetchNotificationsPaginate({ VoidCallback? checkYourNetwork, RefreshController? refreshController, bool isRefresh = false, }) async { final connected = await AppConnectivity.connectivity(); if (isRefresh)`
*No documentation provided (generation failed).*

### `readAll(BuildContext context) async { List<NotificationModel> notif = List.from(state.notifications); for (var i = 0; i < notif.length; i++)`
*No documentation provided (generation failed).*

### `readOne(BuildContext context, { int? id, required int index, }) async { List<NotificationModel> notif = List.from(state.notifications); notif[index] = notif[index].copyWith(readAt: DateTime.now()); final notification = state.countOfNotifications?.copyWith( notification: (state.countOfNotifications?.notification ?? 0) - 1, ); state = state.copyWith( notifications: notif, countOfNotifications: notification, ); final response = await _notificationRepository.readOne(id: id); response.when( success: (data)`
*No documentation provided (generation failed).*

### `fetchCount(BuildContext context) async { final response = await _notificationRepository.getCount(); response.when( success: (data)`
*No documentation provided (generation failed).*
