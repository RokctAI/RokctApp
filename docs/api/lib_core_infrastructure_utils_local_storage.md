# API Reference: local_storage

Source file: `lib/core/infrastructure/utils/local_storage.dart`

## Classes

### class `LocalStorage`

## Whitelisted API Endpoints

### `init() async => CoreLocalStorage.init(); static bool getFirstEntry()`
*No documentation provided (generation failed).*

### `setFirstEntry(bool isFirst) async { await CoreLocalStorage.preferences?.setBool( StorageKeys.keyFirstEntry, isFirst, ); } static Future<void> setToken(String? token) async => CoreLocalStorage.setToken(token); static String getToken() => CoreLocalStorage.getToken(); static void deleteToken() => CoreLocalStorage.deleteToken(); static Future<void> setUiType(int type) async { await CoreLocalStorage.preferences?.setInt(StorageKeys.keyUiType, type); } static int? getUiType() => CoreLocalStorage.preferences?.getInt(StorageKeys.keyUiType); static Future<void> setUser(dynamic user) async { if (CoreLocalStorage.preferences != null)`
*No documentation provided (generation failed).*

### `deleteSearchList() => CoreLocalStorage.preferences?.remove(StorageKeys.keySearchStores); static Future<void> setSavedShopsList(List<int> ids) async { final List<String> idsStrings = ids.map((e) => e.toString()).toList(); await CoreLocalStorage.preferences?.setStringList( StorageKeys.keySavedStores, idsStrings, ); } static List<int> getSavedShopsList()`
*No documentation provided (generation failed).*

### `setSettingsFetched(bool fetched) async { await CoreLocalStorage.preferences?.setBool( StorageKeys.keySettingsFetched, fetched, ); } static bool getSettingsFetched() => CoreLocalStorage.preferences?.getBool(StorageKeys.keySettingsFetched) ?? false; static void deleteSettingsFetched() => CoreLocalStorage.preferences?.remove(StorageKeys.keySettingsFetched); static Future<void> setLanguageData(LanguageData? langData) async => CoreLocalStorage.setLanguageData(langData); static LanguageData? getLanguage() => CoreLocalStorage.getLanguage(); static void deleteLanguage() => CoreLocalStorage.deleteLanguage(); static Future<void> setLangLtr(bool? backward) async => CoreLocalStorage.setLangLtr(backward); static bool getLangLtr() => CoreLocalStorage.getLangLtr(); static void deleteLangLtr() => CoreLocalStorage.deleteLangLtr(); static void logout()`
*No documentation provided (generation failed).*
