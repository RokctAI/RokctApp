import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rokctapp/driver/app_constants.dart';
import 'package:rokctapp/driver/infrastructure/models/models.dart';
import 'package:rokctapp/driver/infrastructure/services/storage_keys.dart';
import 'package:rokctapp/core/local_storage.dart';

class LocalStorage {
  LocalStorage._();

  static Future<void> init() async => CoreLocalStorage.init();

  static Future<void> setToken(String? token) async =>
      CoreLocalStorage.setToken(token);

  static String getToken() => CoreLocalStorage.getToken();

  static void _deleteToken() => CoreLocalStorage.deleteToken();

  static Future<void> setLanguageSelected(bool selected) async =>
      CoreLocalStorage.setLanguageSelected(selected);

  static bool getLanguageSelected() => CoreLocalStorage.getLanguageSelected();

  static void deleteLangSelected() => CoreLocalStorage.deleteLangSelected();

  static Future<void> setSettingsList(List<SettingsData> settings) async =>
      CoreLocalStorage.setSettingsList(settings);

  static List<SettingsData> getSettingsList() =>
      CoreLocalStorage.getSettingsList();

  static Future<void> setTranslations(
    Map<String, dynamic>? translations,
  ) async => CoreLocalStorage.setTranslations(translations);

  static Map<String, dynamic> getTranslations() =>
      CoreLocalStorage.getTranslations();

  static Future<void> setAppThemeMode(bool isDarkMode) async {
    if (CoreLocalStorage.preferences != null) {
      await CoreLocalStorage.preferences!.setBool(
        StorageKeys.keyAppThemeMode,
        isDarkMode,
      );
    }
  }

  static bool getAppThemeMode() =>
      CoreLocalStorage.preferences?.getBool(StorageKeys.keyAppThemeMode) ??
      false;

  static Future<void> setLanguageData(LanguageData? langData) async =>
      CoreLocalStorage.setLanguageData(langData);

  static LanguageData? getLanguage() => CoreLocalStorage.getLanguage();

  static Future<void> setLangLtr(bool? backward) async =>
      CoreLocalStorage.setLangLtr(backward);

  static bool getLangLtr() => CoreLocalStorage.getLangLtr();

  static Future<void> setSelectedCurrency(CurrencyData? currency) async =>
      CoreLocalStorage.setSelectedCurrency(currency);

  static CurrencyData? getSelectedCurrency() =>
      CoreLocalStorage.getSelectedCurrency();

  static Future<void> setAddressSelected(LatLng data) async {
    if (CoreLocalStorage.preferences != null) {
      await CoreLocalStorage.preferences!.setString(
        StorageKeys.keyAddressSelected,
        jsonEncode(data.toJson()),
      );
    }
  }

  static LatLng? getAddressSelected() {
    String dataString =
        CoreLocalStorage.preferences?.getString(
          StorageKeys.keyAddressSelected,
        ) ??
        "";
    if (dataString.isNotEmpty) {
      LatLng data =
          LatLng.fromJson(jsonDecode(dataString)) ??
          LatLng(AppConstants.demoLatitude, AppConstants.demoLongitude);
      return data;
    } else {
      return null;
    }
  }

  static Future<void> setUser(UserData? user) async {
    if (CoreLocalStorage.preferences != null) {
      final String userString = user != null ? jsonEncode(user.toJson()) : '';
      await CoreLocalStorage.preferences!.setString(
        StorageKeys.keyUser,
        userString,
      );
    }
  }

  static UserData? getUser() {
    final savedString = CoreLocalStorage.preferences?.getString(
      StorageKeys.keyUser,
    );
    if (savedString == null) {
      return null;
    }
    final map = jsonDecode(savedString);
    if (map == null) {
      return null;
    }
    return UserData.fromJson(map);
  }

  static void _deleteUser() =>
      CoreLocalStorage.preferences?.remove(StorageKeys.keyUser);

  static Future<void> setDeliveryInfo(DeliveryResponse? info) async {
    if (CoreLocalStorage.preferences != null) {
      final String infoString = ((info != null)
          ? jsonEncode(info.toJson())
          : '');
      await CoreLocalStorage.preferences!.setString(
        StorageKeys.keyCarInfo,
        infoString,
      );
    }
  }

  static DeliveryResponse? getDeliveryInfo() {
    final savedString = CoreLocalStorage.preferences?.getString(
      StorageKeys.keyCarInfo,
    );
    if (savedString == null) {
      return null;
    }
    final map = jsonDecode(savedString);
    if (map == null) {
      return null;
    }
    return DeliveryResponse.fromJson(map);
  }

  static void _deleteDeliveryInfo() =>
      CoreLocalStorage.preferences?.remove(StorageKeys.keyCarInfo);

  static Future<void> setOnline(bool online) async {
    if (CoreLocalStorage.preferences != null) {
      await CoreLocalStorage.preferences!.setBool(
        StorageKeys.keyOnline,
        online,
      );
    }
  }

  static bool getOnline() {
    final online = CoreLocalStorage.preferences?.getBool(StorageKeys.keyOnline);
    if (online == null) {
      return false;
    }
    return online;
  }

  static void _deleteOnline() =>
      CoreLocalStorage.preferences?.remove(StorageKeys.keyOnline);

  static Future<void> setWallet(Wallet? wallet) async {
    if (CoreLocalStorage.preferences != null) {
      final String walletString = wallet != null
          ? jsonEncode(wallet.toJson())
          : '';
      await CoreLocalStorage.preferences!.setString(
        StorageKeys.keyWallet,
        walletString,
      );
    }
  }

  static Wallet? getWallet() {
    final savedString = CoreLocalStorage.preferences?.getString(
      StorageKeys.keyWallet,
    );
    if (savedString == null) {
      return null;
    }
    final map = jsonDecode(savedString);
    if (map == null) {
      return null;
    }
    return Wallet.fromJson(map);
  }

  static void _deleteWallet() =>
      CoreLocalStorage.preferences?.remove(StorageKeys.keyWallet);

  static void logout() {
    _deleteToken();
    _deleteUser();
    _deleteDeliveryInfo();
    _deleteWallet();
    _deleteOnline();
  }
}
