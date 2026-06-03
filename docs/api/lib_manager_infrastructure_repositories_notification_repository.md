# API Reference: notification_repository

Source file: `lib/manager/infrastructure/repositories/notification_repository.dart`

## Classes

### class `NotificationRepository`

## Whitelisted API Endpoints

### `getNotifications({int? page}) async { final data = { if (page != null) 'page': page, 'column': 'created_at', 'sort': 'desc', 'perPage': 7, 'lang': LocalStorage.getLanguage()?.locale, }; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/notifications', queryParameters: data, ); return ApiResult.success( data: NotificationResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `readAll() async { try { final client = dioHttp.client(requireAuth: true); final response = await client.post( '/api/v1/dashboard/notifications/read-all', ); return ApiResult.success( data: NotificationResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `readOne({int? id}) async { final data = { if (id != null) '$id': id, 'lang': LocalStorage.getLanguage()?.locale, }; try { final client = dioHttp.client(requireAuth: true); await client.post( '/api/v1/dashboard/notifications/$id/read-at', queryParameters: data, ); return const ApiResult.success(data: true); } catch (e)`
*No documentation provided (generation failed).*

### `getAllNotifications() async { final data = {'lang': LocalStorage.getLanguage()?.locale}; try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/notifications', queryParameters: data, ); return ApiResult.success( data: NotificationResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getCount() async { try { final client = dioHttp.client(requireAuth: true); final response = await client.get( '/api/v1/dashboard/user/profile/notifications-statistic', ); return ApiResult.success( data: CountNotificationModel.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*
