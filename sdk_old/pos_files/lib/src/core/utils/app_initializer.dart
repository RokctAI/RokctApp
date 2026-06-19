import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../../../app_constants.dart';
import '../constants/constants.dart';

class AppInitializer {
  Future<void> initializeApp() async {
    await _initializeRemoteConfig();
  }

  Future<void> _initializeRemoteConfig() async {
    // Use AppConstants.baseUrl as the site identifier (Tenant Site Name)
    final String tenantSite = AppConstants.baseUrl;
    const String controlPanelUrl = "https://platform.rokct.ai";

    try {
      final response = await http.get(
        Uri.parse(
          '$tenantSite/api/method/paas.api.get_remote_config?app_type=POS',
        ),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final config = responseData['message'];

        if (config != null) {
          String? getString(String key) => config[key]?.toString();
          bool? getBool(String key) =>
              config[key] == 1 || config[key] == true || config[key] == "true";
          int? getInt(String key) =>
              int.tryParse(config[key]?.toString() ?? "");
          double? getDouble(String key) =>
              double.tryParse(config[key]?.toString() ?? "");

          // --- Common Fields ---
          if (getDouble('demoLatitude') != null)
            AppConstants.demoLatitude = getDouble('demoLatitude')!;
          if (getDouble('demoLongitude') != null)
            AppConstants.demoLongitude = getDouble('demoLongitude')!;
          if (getDouble('pinLoadingMin') != null)
            AppConstants.pinLoadingMin = getDouble('pinLoadingMin')!;
          if (getDouble('pinLoadingMax') != null)
            AppConstants.pinLoadingMax = getDouble('pinLoadingMax')!;
          if (getString('googleApiKey') != null)
            AppConstants.googleApiKey = getString('googleApiKey')!;

          // --- POS Specific Fields ---
          if (getString('webUrl') != null)
            AppConstants.webUrl = getString('webUrl')!;
          if (getBool('autoTrn') != null)
            AppConstants.autoTrn = getBool('autoTrn')!;
          if (getBool('playMusicOnOrderStatusChange') != null)
            AppConstants.playMusicOnOrderStatusChange = getBool(
              'playMusicOnOrderStatusChange',
            )!;
          if (getBool('keepPlayingOnNewOrder') != null)
            AppConstants.keepPlayingOnNewOrder = getBool(
              'keepPlayingOnNewOrder',
            )!;

          if (getInt('refreshTime') != null)
            AppConstants.refreshTime = Duration(
              seconds: getInt('refreshTime')!,
            );
          if (getInt('animationDuration') != null)
            AppConstants.animationDuration = Duration(
              milliseconds: getInt('animationDuration')!,
            );
          if (getInt('weatherRefresher') != null)
            AppConstants.weatherRefresher = Duration(
              minutes: getInt('weatherRefresher')!,
            );

          if (getDouble('radius') != null)
            AppConstants.radius = getDouble('radius')!;
          if (getString('keyShopData') != null)
            AppConstants.keyShopData = getString('keyShopData')!;

          if (getBool('autoDeliver') != null)
            AppConstants.autoDeliver = getBool('autoDeliver')!;
          if (getBool('secondScreen') != null)
            AppConstants.secondScreen = getBool('secondScreen')!;
          if (getBool('enableJuvoONE') != null)
            AppConstants.enableJuvoONE = getBool('enableJuvoONE')!;
          if (getBool('skipPin') != null)
            AppConstants.skipPin = getBool('skipPin')!;
          if (getBool('useDummyDataFallback') != null)
            AppConstants.useDummyDataFallback = getBool(
              'useDummyDataFallback',
            )!;
          if (getBool('enableOfflineMode') != null)
            AppConstants.enableOfflineMode = getBool('enableOfflineMode')!;
          if (getBool('sound') != null) AppConstants.sound = getBool('sound')!;

          if (getInt('idleTimeout') != null)
            AppConstants.idleTimeout = Duration(
              minutes: getInt('idleTimeout')!,
            );
          if (getInt('fetchTime') != null)
            AppConstants.fetchTime = Duration(seconds: getInt('fetchTime')!);
          if (getInt('dashboardFetchTime') != null)
            AppConstants.dashboardFetchTime = Duration(
              minutes: getInt('dashboardFetchTime')!,
            );

          if (getString('openWeatherApiKey') != null)
            AppConstants.openWeatherApiKey = getString('openWeatherApiKey')!;
          if (getBool('weatherIcon') != null)
            AppConstants.weatherIcon = getBool('weatherIcon')!;
          if (getInt('rainPOP') != null)
            AppConstants.rainPOP = getInt('rainPOP')!;
          if (getString('chatGpt') != null)
            AppConstants.chatGpt = getString('chatGpt')!;
          if (getString('yocoPublicKey') != null)
            AppConstants.yocoPublicKey = getString('yocoPublicKey')!;
          if (getString('yocoPrivateKey') != null)
            AppConstants.yocoPrivateKey = getString('yocoPrivateKey')!;
          if (getString('yocoEnvironment') != null)
            AppConstants.yocoEnvironment = getString('yocoEnvironment')!;

          if (getString('dateAt') != null)
            AppConstants.dateAt = getString('dateAt')!;

          if (getInt('quickSaleDefaultQuantity') != null)
            AppConstants.quickSaleDefaultQuantity = getInt(
              'quickSaleDefaultQuantity',
            )!;
          if (getInt('quickSaleCouponTapCount') != null)
            AppConstants.quickSaleCouponTapCount = getInt(
              'quickSaleCouponTapCount',
            )!;
          if (getInt('quickSaleStockId') != null)
            AppConstants.quickSaleStockId = getInt('quickSaleStockId')!;
          if (getString('quickSaleCouponCode') != null)
            AppConstants.quickSaleCouponCode = getString(
              'quickSaleCouponCode',
            )!;

          if (getInt('maintenanceCheckDays') != null)
            AppConstants.maintenanceCheckDays = getInt('maintenanceCheckDays')!;
          if (getInt('preFilterReplaceDays') != null)
            AppConstants.preFilterReplaceDays = getInt('preFilterReplaceDays')!;
          if (getInt('postFilterReplaceDays') != null)
            AppConstants.postFilterReplaceDays = getInt(
              'postFilterReplaceDays',
            )!;
          if (getInt('roFilterReplaceDays') != null)
            AppConstants.roFilterReplaceDays = getInt('roFilterReplaceDays')!;
          if (getInt('vesselReplaceDays') != null)
            AppConstants.vesselReplaceDays = getInt('vesselReplaceDays')!;
          if (getInt('roMembraneReplaceDays') != null)
            AppConstants.roMembraneReplaceDays = getInt(
              'roMembraneReplaceDays',
            )!;

          // JSON fields
          if (config['quickSaleNoUserStockIds'] != null) {
            try {
              List<dynamic> list = jsonDecode(
                config['quickSaleNoUserStockIds'],
              );
              AppConstants.quickSaleNoUserStockIds = list.cast<int>();
            } catch (e) {
              if (kDebugMode)
                print("Error parsing quickSaleNoUserStockIds: $e");
            }
          }

          if (config['megaCharMaintenanceDurations'] != null) {
            try {
              Map<String, dynamic> map = jsonDecode(
                config['megaCharMaintenanceDurations'],
              );
              AppConstants.megaCharMaintenanceDurations = map.map(
                (key, value) => MapEntry(key, value as int),
              );
            } catch (e) {
              if (kDebugMode)
                print("Error parsing megaCharMaintenanceDurations: $e");
            }
          }

          if (config['softenerMaintenanceDurations'] != null) {
            try {
              Map<String, dynamic> map = jsonDecode(
                config['softenerMaintenanceDurations'],
              );
              AppConstants.softenerMaintenanceDurations = map.map(
                (key, value) => MapEntry(key, value as int),
              );
            } catch (e) {
              if (kDebugMode)
                print("Error parsing softenerMaintenanceDurations: $e");
            }
          }

          if (config['maintenanceTypes'] != null) {
            try {
              Map<String, dynamic> map = jsonDecode(config['maintenanceTypes']);
              AppConstants.maintenanceTypes = map.map(
                (key, value) => MapEntry(key, value as String),
              );
            } catch (e) {
              if (kDebugMode) print("Error parsing maintenanceTypes: $e");
            }
          }

          if (config['filterTypes'] != null) {
            try {
              Map<String, dynamic> map = jsonDecode(config['filterTypes']);
              AppConstants.filterTypes = map.map(
                (key, value) => MapEntry(key, value as String),
              );
            } catch (e) {
              if (kDebugMode) print("Error parsing filterTypes: $e");
            }
          }
        }
      } else {
        if (kDebugMode) {
          print(
            "Failed to fetch remote config. Status: ${response.statusCode}",
          );
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching remote config: $e");
      }
    }
  }
}
