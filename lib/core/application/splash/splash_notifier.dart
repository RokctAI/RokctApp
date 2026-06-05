import 'dart:io' show Platform;
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';
import 'package:rokctapp/core/infrastructure/utils/services.dart';
import 'package:rokctapp/core/presentation/routes/app_router.dart';
import 'package:uuid/uuid.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:rokctapp/core/application/splash/splash_state.dart';

class SplashNotifier extends Notifier<SplashState> {
  @override
  SplashState build() => const SplashState();

  Future<void> getToken(
    BuildContext context, {
    VoidCallback? goMain,
    VoidCallback? goLogin,
    VoidCallback? goNoInternet,
  }) async {
    final connect = await AppConnectivity.connectivity();
    if (connect) {
      String visitorUuid = LocalStorage.getVisitorUuid();
      if (visitorUuid.isEmpty) {
        visitorUuid = const Uuid().v4();
        await LocalStorage.setVisitorUuid(visitorUuid);
      }

      // Collect telemetry metadata
      String? appVersion;
      try {
        final packageInfo = await PackageInfo.fromPlatform();
        appVersion = "${packageInfo.version} (${packageInfo.buildNumber})";
      } catch (e) {
        debugPrint("==> failed to fetch package info: $e");
      }

      String? os;
      String? osVersion;
      try {
        os = Platform.operatingSystem;
        osVersion = Platform.operatingSystemVersion;
      } catch (e) {
        debugPrint("==> failed to fetch platform info: $e");
      }

      final String? userId = LocalStorage.getUser()?.id?.toString();

      // Report unique visit asynchronously (fire-and-forget telemetry)
      settingsRepository.recordUniqueVisit(
        visitorUuid,
        userId: userId,
        appVersion: appVersion,
        os: os,
        osVersion: osVersion,
      );

      if (LocalStorage.getSettingsFetched()) {
        final response = await settingsRepository.getGlobalSettings();
        response.when(
          success: (data) {
            LocalStorage.setSettingsList(data.data ?? []);
            LocalStorage.setSettingsFetched(true);
          },
          failure: (failure, status) {
            debugPrint('==> error with settings fetched');
            AppHelpers.showCheckTopSnackBar(context, failure);
          },
        );
      }

      if (LocalStorage.getToken().isEmpty) {
        goLogin?.call();
      } else {
        goMain?.call();
      }

      if (!LocalStorage.getSettingsFetched()) {
        final response = await settingsRepository.getGlobalSettings();
        response.when(
          success: (data) {
            LocalStorage.setSettingsList(data.data ?? []);
            LocalStorage.setSettingsFetched(true);
          },
          failure: (failure, status) {
            debugPrint('==> error with settings fetched');
            AppHelpers.showCheckTopSnackBar(context, failure);
          },
        );
      }
    } else {
      goNoInternet?.call();
    }
  }

  Future<void> getTranslations(BuildContext context) async {
    final connect = await AppConnectivity.connectivity();
    if (connect) {
      final response = await settingsRepository.getMobileTranslations();
      response.when(
        success: (data) {
          LocalStorage.setTranslations(data.data);
        },
        failure: (failure, status) {
          debugPrint('==> error with fetching translations $failure');
          // AppHelpers.showCheckTopSnackBar(context, failure);
        },
      );
    } else {
      if (context.mounted) {
        context.replaceRoute(const NoConnectionRoute());
      }
    }
  }
}
