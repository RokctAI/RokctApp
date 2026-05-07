import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rokctapp/core/infrastructure/models/data/settings_data.dart';
import 'package:rokctapp/core/infrastructure/models/data/currency_data.dart';
import 'package:rokctapp/core/infrastructure/models/data/language.dart';
import 'package:rokctapp/core/infrastructure/constants/storage_keys.dart';

abstract class CoreLocalStorage {
  CoreLocalStorage._();
  static SharedPreferences? preferences;

  static Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  // Token
  static Future<void> setToken(String? token) async {
    await preferences?.setString(StorageKeys.keyToken, token ?? '');
  }

  static String getToken() =>
      preferences?.getString(StorageKeys.keyToken) ?? '';

  static void deleteToken() => preferences?.remove(StorageKeys.keyToken);

  // Language Selected
  static Future<void> setLanguageSelected(bool selected) async {
    await preferences?.setBool(StorageKeys.keyLangSelected, selected);
  }

  static bool getLanguageSelected() =>
      preferences?.getBool(StorageKeys.keyLangSelected) ?? false;

  static void deleteLangSelected() =>
      preferences?.remove(StorageKeys.keyLangSelected);

  // Language Data
  static Future<void> setLanguageData(LanguageData? langData) async {
    final String lang = jsonEncode(langData?.toJson());
    await preferences?.setString(StorageKeys.keyLanguageData, lang);
  }

  static LanguageData? getLanguage() {
    final lang = preferences?.getString(StorageKeys.keyLanguageData);
    if (lang == null) {
      return null;
    }
    final map = jsonDecode(lang);
    if (map == null) {
      return null;
    }
    return LanguageData.fromJson(map);
  }

  static void deleteLanguage() =>
      preferences?.remove(StorageKeys.keyLanguageData);

  // Settings List
  static Future<void> setSettingsList(List<SettingsData> settings) async {
    final List<String> strings = settings
        .map((setting) => jsonEncode(setting.toJson()))
        .toList();
    await preferences?.setStringList(StorageKeys.keyGlobalSettings, strings);
  }

  static List<SettingsData> getSettingsList() {
    final List<String> settings =
        preferences?.getStringList(StorageKeys.keyGlobalSettings) ?? [];
    final List<SettingsData> settingsList = settings
        .map((setting) => SettingsData.fromJson(jsonDecode(setting)))
        .toList();
    return settingsList;
  }

  static void deleteSettingsList() =>
      preferences?.remove(StorageKeys.keyGlobalSettings);

  // Translations
  static Future<void> setTranslations(
    Map<String, dynamic>? translations,
  ) async {
    if (preferences != null) {
      final String encoded = jsonEncode(translations);
      final currentLocale = getLanguage()?.locale ?? 'en';
      // Cache for each language
      await preferences!.setString(
        '${StorageKeys.keyTranslations}_$currentLocale',
        encoded,
      );
      // Backward compatibility
      await preferences!.setString(StorageKeys.keyTranslations, encoded);
    }
  }

  static Map<String, dynamic> getTranslations({String? locale}) {
    final currentLocale = locale ?? getLanguage()?.locale ?? 'en';
    String encoded =
        preferences?.getString(
          '${StorageKeys.keyTranslations}_$currentLocale',
        ) ??
        '';
    if (encoded.isEmpty) {
      encoded = preferences?.getString(StorageKeys.keyTranslations) ?? '';
    }
    if (encoded.isEmpty) {
      return {};
    }
    final Map<String, dynamic> decoded = jsonDecode(encoded);
    return decoded;
  }

  static void deleteTranslations() =>
      preferences?.remove(StorageKeys.keyTranslations);

  // Currency
  static Future<void> setSelectedCurrency(CurrencyData? currency) async {
    final String currencyString = jsonEncode(currency?.toJson());
    await preferences?.setString(
      StorageKeys.keySelectedCurrency,
      currencyString,
    );
  }

  static CurrencyData? getSelectedCurrency() {
    String json = preferences?.getString(StorageKeys.keySelectedCurrency) ?? '';
    if (json.isEmpty) {
      return null;
    } else {
      final map = jsonDecode(json);
      return CurrencyData.fromJson(map);
    }
  }

  static void deleteSelectedCurrency() =>
      preferences?.remove(StorageKeys.keySelectedCurrency);

  // LTR
  static Future<void> setLangLtr(bool? backward) async {
    await preferences?.setBool(StorageKeys.keyLangLtr, (backward ?? false));
  }

  static bool getLangLtr() =>
      !(preferences?.getBool(StorageKeys.keyLangLtr) ?? false);

  static void deleteLangLtr() => preferences?.remove(StorageKeys.keyLangLtr);
}
