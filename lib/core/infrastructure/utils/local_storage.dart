import 'dart:convert';
import 'package:rokctapp/customer/models/models.dart';
import 'package:rokctapp/core/presentation/theme/theme_preference.dart';
import 'package:rokctapp/core/infrastructure/constants/storage_keys.dart';
import 'package:rokctapp/core/local_storage.dart';

abstract class LocalStorage {
  LocalStorage._();

  static Future<void> init() async => CoreLocalStorage.init();

  static bool getFirstEntry() {
    return CoreLocalStorage.preferences?.getBool(StorageKeys.keyFirstEntry) ??
        true;
  }

  static Future<void> setFirstEntry(bool isFirst) async {
    await CoreLocalStorage.preferences?.setBool(
      StorageKeys.keyFirstEntry,
      isFirst,
    );
  }

  static Future<void> setToken(String? token) async =>
      CoreLocalStorage.setToken(token);

  static String getToken() => CoreLocalStorage.getToken();

  static void deleteToken() => CoreLocalStorage.deleteToken();

  static Future<void> setUiType(int type) async {
    await CoreLocalStorage.preferences?.setInt(StorageKeys.keyUiType, type);
  }

  static int? getUiType() =>
      CoreLocalStorage.preferences?.getInt(StorageKeys.keyUiType);

  static Future<void> setUser(ProfileData? user) async {
    if (CoreLocalStorage.preferences != null) {
      final String userString = user != null ? jsonEncode(user.toJson()) : '';
      await CoreLocalStorage.preferences!.setString(
        StorageKeys.keyUser,
        userString,
      );
    }
  }

  static ProfileData? getUser() {
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
    return ProfileData.fromJson(map);
  }

  static void _deleteUser() =>
      CoreLocalStorage.preferences?.remove(StorageKeys.keyUser);

  static Future<void> setSearchHistory(List<String> list) async {
    final List<String> idsStrings = list.map((e) => e.toString()).toList();
    await CoreLocalStorage.preferences?.setStringList(
      StorageKeys.keySearchStores,
      idsStrings,
    );
  }

  static List<String> getSearchList() {
    final List<String> strings =
        CoreLocalStorage.preferences?.getStringList(
          StorageKeys.keySearchStores,
        ) ??
        [];
    return strings;
  }

  static void deleteSearchList() =>
      CoreLocalStorage.preferences?.remove(StorageKeys.keySearchStores);

  static Future<void> setSavedShopsList(List<int> ids) async {
    final List<String> idsStrings = ids.map((e) => e.toString()).toList();
    await CoreLocalStorage.preferences?.setStringList(
      StorageKeys.keySavedStores,
      idsStrings,
    );
  }

  static List<int> getSavedShopsList() {
    final List<String> strings =
        CoreLocalStorage.preferences?.getStringList(
          StorageKeys.keySavedStores,
        ) ??
        [];
    if (strings.isNotEmpty) {
      final List<int> ids = strings.map((e) => int.parse(e)).toList();
      return ids;
    } else {
      return [];
    }
  }

  static void deleteSavedShopsList() =>
      CoreLocalStorage.preferences?.remove(StorageKeys.keySavedStores);

  static Future<void> setAddressSelected(AddressData data) async {
    await CoreLocalStorage.preferences?.setString(
      StorageKeys.keyAddressSelected,
      jsonEncode(data.toJson()),
    );
  }

  static AddressData? getAddressSelected() {
    String dataString =
        CoreLocalStorage.preferences?.getString(
          StorageKeys.keyAddressSelected,
        ) ??
        "";
    if (dataString.isNotEmpty) {
      AddressData data = AddressData.fromJson(jsonDecode(dataString));
      return data;
    } else {
      return null;
    }
  }

  static void deleteAddressSelected() =>
      CoreLocalStorage.preferences?.remove(StorageKeys.keyAddressSelected);

  static Future<void> setAddressInformation(AddressInformation data) async {
    await CoreLocalStorage.preferences?.setString(
      StorageKeys.keyAddressInformation,
      jsonEncode(data.toJson()),
    );
  }

  static AddressInformation? getAddressInformation() {
    String dataString =
        CoreLocalStorage.preferences?.getString(
          StorageKeys.keyAddressInformation,
        ) ??
        "";
    if (dataString.isNotEmpty) {
      AddressInformation data = AddressInformation.fromJson(
        jsonDecode(dataString),
      );
      return data;
    } else {
      return null;
    }
  }

  static void deleteAddressInformation() =>
      CoreLocalStorage.preferences?.remove(StorageKeys.keyAddressInformation);

  static Future<void> setLanguageSelected(bool selected) async =>
      CoreLocalStorage.setLanguageSelected(selected);

  static bool getLanguageSelected() => CoreLocalStorage.getLanguageSelected();

  static void deleteLangSelected() => CoreLocalStorage.deleteLangSelected();

  static Future<void> setSelectedCurrency(CurrencyData currency) async =>
      CoreLocalStorage.setSelectedCurrency(currency);

  static CurrencyData? getSelectedCurrency() =>
      CoreLocalStorage.getSelectedCurrency();

  static void deleteSelectedCurrency() =>
      CoreLocalStorage.deleteSelectedCurrency();

  static Future<void> setWalletData(Wallet? wallet) async {
    final String walletString = jsonEncode(wallet?.toJson());
    await CoreLocalStorage.preferences?.setString(
      StorageKeys.keyWalletData,
      walletString,
    );
  }

  static Future<void> setWallet(Wallet? wallet) => setWalletData(wallet);

  static Wallet? getWalletData() {
    final wallet = CoreLocalStorage.preferences?.getString(
      StorageKeys.keyWalletData,
    );
    if (wallet == null) {
      return null;
    }
    final map = jsonDecode(wallet);
    if (map == null) {
      return null;
    }
    return Wallet.fromJson(map);
  }

  static void deleteWalletData() =>
      CoreLocalStorage.preferences?.remove(StorageKeys.keyWalletData);

  static Future<void> setSettingsList(List<SettingsData> settings) async =>
      CoreLocalStorage.setSettingsList(settings);

  static List<SettingsData> getSettingsList() =>
      CoreLocalStorage.getSettingsList();

  static void deleteSettingsList() => CoreLocalStorage.deleteSettingsList();

  static Future<void> setTranslations(
    Map<String, dynamic>? translations,
  ) async => CoreLocalStorage.setTranslations(translations);

  static Map<String, dynamic> getTranslations() =>
      CoreLocalStorage.getTranslations();

  static void deleteTranslations() => CoreLocalStorage.deleteTranslations();

  static bool getAppThemeMode() {
    final modeKey =
        CoreLocalStorage.preferences?.getString(ThemePreference.prefKey) ??
        CustomThemeMode.light.toKey;

    return CustomThemeModeX.toValue(modeKey) == CustomThemeMode.dark;
  }

  static Future<void> setSettingsFetched(bool fetched) async {
    await CoreLocalStorage.preferences?.setBool(
      StorageKeys.keySettingsFetched,
      fetched,
    );
  }

  static bool getSettingsFetched() =>
      CoreLocalStorage.preferences?.getBool(StorageKeys.keySettingsFetched) ??
      false;

  static void deleteSettingsFetched() =>
      CoreLocalStorage.preferences?.remove(StorageKeys.keySettingsFetched);

  static Future<void> setLanguageData(LanguageData? langData) async =>
      CoreLocalStorage.setLanguageData(langData);

  static LanguageData? getLanguage() => CoreLocalStorage.getLanguage();

  static void deleteLanguage() => CoreLocalStorage.deleteLanguage();

  static Future<void> setLangLtr(bool? backward) async =>
      CoreLocalStorage.setLangLtr(backward);

  static bool getLangLtr() => CoreLocalStorage.getLangLtr();

  static void deleteLangLtr() => CoreLocalStorage.deleteLangLtr();

  static void logout() {
    deleteWalletData();
    deleteSavedShopsList();
    deleteSearchList();
    _deleteUser();
    deleteToken();
    deleteAddressSelected();
    deleteAddressInformation();
  }
}
