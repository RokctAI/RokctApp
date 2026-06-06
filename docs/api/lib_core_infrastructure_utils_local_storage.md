# API Reference: local_storage

Source file: `lib/core/infrastructure/utils/local_storage.dart`

## Classes

### class `LocalStorage`

## Whitelisted API Endpoints

### `init() async => CoreLocalStorage.init(); static bool getFirstEntry()`
*No documentation provided (generation failed).*

### `setFirstEntry(bool isFirst) async { await CoreLocalStorage.preferences?.setBool( StorageKeys.keyFirstEntry, isFirst, ); } static Future<void> setToken(String? token) async => CoreLocalStorage.setToken(token); static String getToken() => CoreLocalStorage.getToken(); static void deleteToken() => CoreLocalStorage.deleteToken(); static Future<void> setUiType(int type) async { await CoreLocalStorage.preferences?.setInt(StorageKeys.keyUiType, type); } static int? getUiType() => CoreLocalStorage.preferences?.getInt(StorageKeys.keyUiType); static Future<void> setUser(dynamic user) async { if (CoreLocalStorage.preferences != null)`
*No documentation provided (generation failed).*

### `deleteSearchList() => CoreLocalStorage.preferences?.remove(StorageKeys.keySearchStores); static Future<void> setSavedShopsList(List<String> ids) async { await CoreLocalStorage.preferences?.setStringList( StorageKeys.keySavedStores, ids, ); } static List<String> getSavedShopsList()`
*No documentation provided (generation failed).*

### `setSettingsFetched(bool fetched) async { await CoreLocalStorage.preferences?.setBool( StorageKeys.keySettingsFetched, fetched, ); } static bool getSettingsFetched() => CoreLocalStorage.preferences?.getBool(StorageKeys.keySettingsFetched) ?? false; static void deleteSettingsFetched() => CoreLocalStorage.preferences?.remove(StorageKeys.keySettingsFetched); static Future<void> setLanguageData(LanguageData? langData) async => CoreLocalStorage.setLanguageData(langData); static LanguageData? getLanguage() => CoreLocalStorage.getLanguage(); static void deleteLanguage() => CoreLocalStorage.deleteLanguage(); static Future<void> setLangLtr(bool? backward) async => CoreLocalStorage.setLangLtr(backward); static bool getLangLtr() => CoreLocalStorage.getLangLtr(); static void deleteLangLtr() => CoreLocalStorage.deleteLangLtr(); static Future<void> setOfflineUser(Map<String, Dyn>? data) async { await CoreLocalStorage.preferences?.setString(StorageKeys.keyOfflineUser, jsonEncode(data)); } static Map<String, Dyn>? getOfflineUser()`
*No documentation provided (generation failed).*

### `deleteOfflineUser() => CoreLocalStorage.preferences?.remove(StorageKeys.keyOfflineUser); static Future<void> setOfflineQueue(List<Dyn> items) async { await CoreLocalStorage.preferences?.setStringList( StorageKeys.keyOfflineQueue, items.map((item) => jsonEncode(item)).toList(), ); } static List<Dyn> getOfflineQueue()`
*No documentation provided (generation failed).*

### `jsonDecode(s)).toList(); } static Future<void> setSyncErrorCount(int count) async { await CoreLocalStorage.preferences?.setInt('sync_error_count', count); } static int getSyncErrorCount() => CoreLocalStorage.preferences?.getInt('sync_error_count') ?? 0; static Future<void> setLastSyncError(String? error) async { await CoreLocalStorage.preferences?.setString('last_sync_error', error ?? ''); } static String getLastSyncError() => CoreLocalStorage.preferences?.getString('last_sync_error') ?? ''; static Future<void> setOnline(bool online) async => CoreLocalStorage.setOnline(online); static bool getOnline() => CoreLocalStorage.getOnline(); static void deleteOnline() => CoreLocalStorage.deleteOnline(); static void logout()`
*No documentation provided (generation failed).*
