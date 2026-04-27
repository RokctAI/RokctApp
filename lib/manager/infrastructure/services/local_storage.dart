import 'dart:convert';
import 'package:rokctapp/manager/infrastructure/models/models.dart';
import 'package:rokctapp/manager/infrastructure/services/storage_keys.dart';
import 'package:rokctapp/core/local_storage.dart';

class LocalStorage {
  LocalStorage._();

  static bool getSubscription() {
    return false;
  }

  static Future<void> init() async => CoreLocalStorage.init();

  static Future<void> setToken(String? token) async =>
      CoreLocalStorage.setToken(token);

  static Future<void> setAddressSelected(AddressData data) async {
    if (CoreLocalStorage.preferences != null) {
      await CoreLocalStorage.preferences!.setString(
        StorageKeys.keyAddressSelected,
        jsonEncode(data.toJson()),
      );
    }
  }

  static AddressData? getAddressSelected() {
    String dataString =
        CoreLocalStorage.preferences?.getString(StorageKeys.keyAddressSelected) ?? "";
    if (dataString.isNotEmpty) {
      AddressData data = AddressData.fromJson(jsonDecode(dataString));
      return data;
    } else {
      return null;
    }
  }

  static Future<void> setWalletData(Wallet? wallet) async {
    if (CoreLocalStorage.preferences != null) {
      final String walletString = jsonEncode(wallet?.toJson());
      await CoreLocalStorage.preferences!.setString(StorageKeys.keyWalletData, walletString);
    }
  }

  static String getToken() => CoreLocalStorage.getToken();

  static void _deleteToken() => CoreLocalStorage.deleteToken();

  static Future<void> setLanguageSelected(bool selected) async =>
      CoreLocalStorage.setLanguageSelected(selected);

  static bool getLanguageSelected() => CoreLocalStorage.getLanguageSelected();

  static Future<void> setSettingsList(List<SettingsData> settings) async =>
      CoreLocalStorage.setSettingsList(settings);

  static List<SettingsData> getSettingsList() =>
      CoreLocalStorage.getSettingsList();

  static Future<void> setTranslations(
    Map<String, dynamic>? translations,
  ) async =>
      CoreLocalStorage.setTranslations(translations);

  static Map<String, dynamic> getTranslations({String? locale}) =>
      CoreLocalStorage.getTranslations(locale: locale);

  static Future<void> setAppThemeMode(bool isDarkMode) async {
    if (CoreLocalStorage.preferences != null) {
      await CoreLocalStorage.preferences!.setBool(StorageKeys.keyAppThemeMode, isDarkMode);
    }
  }

  static bool getAppThemeMode() =>
      CoreLocalStorage.preferences?.getBool(StorageKeys.keyAppThemeMode) ?? false;

  static Future<void> setLanguageData(LanguageData? langData) async =>
      CoreLocalStorage.setLanguageData(langData);

  static LanguageData? getLanguage() => CoreLocalStorage.getLanguage();

  static Future<void> setActiveLanguages(List<LanguageData> languages) async {
    if (CoreLocalStorage.preferences != null) {
      final List<String> strings = languages
          .map((language) => jsonEncode(language.toJson()))
          .toList();
      await CoreLocalStorage.preferences!.setStringList(
        StorageKeys.keyActiveLanguages,
        strings,
      );
    }
  }

  static List<LanguageData> getActiveLanguages() {
    final List<String> languages =
        CoreLocalStorage.preferences?.getStringList(StorageKeys.keyActiveLanguages) ?? [];
    final List<LanguageData> localLanguages = languages
        .map((language) => LanguageData.fromJson(jsonDecode(language)))
        .toList(growable: true);
    return localLanguages.isEmpty
        ? [LanguageData().copyWith(title: 'English', locale: 'en')]
        : localLanguages;
  }

  static Future<void> setLangLtr(bool? backward) async =>
      CoreLocalStorage.setLangLtr(backward);

  static bool getLangLtr() => CoreLocalStorage.getLangLtr();

  static Future<void> setSelectedCurrency(CurrencyData? currency) async =>
      CoreLocalStorage.setSelectedCurrency(currency);

  static CurrencyData? getSelectedCurrency() =>
      CoreLocalStorage.getSelectedCurrency();

  static Future<void> setUser(UserData? user) async {
    if (CoreLocalStorage.preferences != null) {
      final String userString = user != null ? jsonEncode(user.toJson()) : '';
      await CoreLocalStorage.preferences!.setString(StorageKeys.keyUser, userString);
    }
  }

  static UserData? getUser() {
    final savedString = CoreLocalStorage.preferences?.getString(StorageKeys.keyUser);
    if (savedString == null) {
      return null;
    }
    final map = jsonDecode(savedString);
    if (map == null) {
      return null;
    }
    return UserData.fromJson(map);
  }

  static void _deleteUser() => CoreLocalStorage.preferences?.remove(StorageKeys.keyUser);

  static Future<void> setWallet(Wallet? wallet) async {
    if (CoreLocalStorage.preferences != null) {
      final String walletString = wallet != null
          ? jsonEncode(wallet.toJson())
          : '';
      await CoreLocalStorage.preferences!.setString(StorageKeys.keyWallet, walletString);
    }
  }

  static Wallet? getWallet() {
    final savedString = CoreLocalStorage.preferences?.getString(StorageKeys.keyWallet);
    if (savedString == null) {
      return null;
    }
    final map = jsonDecode(savedString);
    if (map == null) {
      return null;
    }
    return Wallet.fromJson(map);
  }

  static void _deleteWallet() => CoreLocalStorage.preferences?.remove(StorageKeys.keyWallet);

  static Future<void> setShop(ShopData? shop) async {
    if (CoreLocalStorage.preferences != null) {
      final String shopString = shop != null ? jsonEncode(shop.toJson()) : '';
      await CoreLocalStorage.preferences!.setString(StorageKeys.keyShop, shopString);
    }
  }

  static ShopData? getShop() {
    final savedString = CoreLocalStorage.preferences?.getString(StorageKeys.keyShop);
    if (savedString == null) {
      return null;
    }
    final map = jsonDecode(savedString);
    if (map == null) {
      return null;
    }
    return ShopData.fromJson(map);
  }

  static void _deleteShop() => CoreLocalStorage.preferences?.remove(StorageKeys.keyShop);

  static Future<void> setSystemLanguage(LanguageData? lang) async {
    if (CoreLocalStorage.preferences != null) {
      final String langString = jsonEncode(lang?.toJson());
      await CoreLocalStorage.preferences!.setString(StorageKeys.keySystemLanguage, langString);
    }
  }

  static LanguageData? getSystemLanguage() {
    final lang = CoreLocalStorage.preferences?.getString(StorageKeys.keySystemLanguage);
    if (lang == null) {
      return null;
    }
    final map = jsonDecode(lang);
    if (map == null) {
      return null;
    }
    return LanguageData.fromJson(map);
  }

  static void logout() {
    _deleteToken();
    _deleteUser();
    _deleteWallet();
    _deleteShop();
  }
}
