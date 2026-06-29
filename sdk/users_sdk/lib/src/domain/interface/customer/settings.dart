import 'package:rokctapp/customer/models/data/help_data.dart';
import 'package:rokctapp/customer/models/data/notification_list_data.dart';

import 'package:core_sdk/core_sdk.dart';
import 'package:rokctapp/customer/models/data/translation.dart';
import 'package:rokctapp/customer/models/models.dart';

abstract class SettingsRepositoryFacade {
  Future<ApiResult<GlobalSettingsResponse>> getGlobalSettings();

  Future<ApiResult<MobileTranslationsResponse>> getMobileTranslations();

  Future<ApiResult<LanguagesResponse>> getLanguages();

  Future<ApiResult<NotificationsListModel>> getNotificationList();

  Future<ApiResult<dynamic>> updateNotification(
    List<NotificationData>? notifications,
  );

  Future<ApiResult<HelpModel>> getFaq();

  Future<ApiResult<Translation>> getTerm();

  Future<ApiResult<Translation>> getPolicy();

  Future<ApiResult<void>> recordUniqueVisit(
    String visitorId, {
    String? userId,
    String? appVersion,
    String? os,
    String? osVersion,
  });

  Future<ApiResult<void>> reportClientError(String title, String error);
}

