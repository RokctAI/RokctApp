# API Reference: settings_repository

Source file: `lib/customer/repository/settings_repository.dart`

## Classes

### class `SettingsRepository`

## Whitelisted API Endpoints

### `getGlobalSettings() async { try { final client = dioHttp.client(requireAuth: false); final response = await client.get('/api/v1/rest/settings'); return ApiResult.success( data: GlobalSettingsResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getMobileTranslations() async { final data = {'lang': LocalStorage.getLanguage()?.locale ?? 'en'}; try { final client = dioHttp.client(requireAuth: false); final response = await client.get( '/api/v1/rest/translations/paginate', queryParameters: data, ); return ApiResult.success( data: MobileTranslationsResponse.fromJson(response.data), ); } catch (e)`
*No documentation provided (generation failed).*

### `getLanguages() async { try { final client = dioHttp.client(requireAuth: false); final response = await client.get('/api/v1/rest/languages/active'); if (LocalStorage.getLanguage() == null || !(LanguagesResponse.fromJson(response.data).data ?.map((e) => e.id) .contains(LocalStorage.getLanguage()?.id) ?? true))`
*No documentation provided (generation failed).*

### `getFaq() async { try { final client = dioHttp.client(requireAuth: true); final response = await client.get('/api/v1/rest/faqs/paginate'); return ApiResult.success(data: HelpModel.fromJson(response.data)); } catch (e)`
*No documentation provided (generation failed).*

### `getTerm() async { try { final client = dioHttp.client(requireAuth: false); final response = await client.get('/api/v1/rest/term'); return ApiResult.success( data: Translation.fromJson(response.data["data"]["translation"]), ); } catch (e)`
*No documentation provided (generation failed).*

### `getPolicy() async { try { final client = dioHttp.client(requireAuth: false); final response = await client.get('/api/v1/rest/policy'); return ApiResult.success( data: Translation.fromJson(response.data["data"]["translation"]), ); } catch (e)`
*No documentation provided (generation failed).*

### `getNotificationList() async { try { final client = dioHttp.client(requireAuth: true); final response = await client.get('/api/v1/dashboard/user/notifications'); return ApiResult.success( data: notificationsListModelFromJson(response.data) ?? NotificationsListModel(), ); } catch (e)`
*No documentation provided (generation failed).*

### `updateNotification(List<NotificationData>? notifications, ) async { try { final client = dioHttp.client(requireAuth: true); final data = { for (int i = 0; i < notifications!.length; i++) "notifications[$i][notification_id]": notifications[i].id, for (int i = 0; i < notifications.length; i++) "notifications[$i][active]": notifications[i].active! ? 1 : 0, }; await client.post( '/api/v1/dashboard/user/update/notifications', queryParameters: data, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `recordUniqueVisit(String visitorId, { String? userId, String? appVersion, String? os, String? osVersion, }) async { try { final client = dioHttp.client(requireAuth: false); await client.post( '/api/method/rcore.tenant.api.record_unique_visit', data: { 'visitor_id': visitorId, if (userId != null && userId.isNotEmpty) 'user_id': userId, if (appVersion != null) 'app_version': appVersion, if (os != null) 'os': os, if (osVersion != null) 'os_version': osVersion, }, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*

### `reportClientError(String title, String error) async { try { final client = dioHttp.client(requireAuth: false); await client.post( '/api/method/rcore.tenant.api.report_client_error', data: { 'title': title, 'error': error, }, ); return const ApiResult.success(data: null); } catch (e)`
*No documentation provided (generation failed).*
