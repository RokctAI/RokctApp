# API Reference: local_storage

Source file: `lib/core/local_storage.dart`

## Classes

### class `CoreLocalStorage`

## Whitelisted API Endpoints

### `init() async { preferences = await SharedPreferences.getInstance(); } static Future<void> setToken(String? token) async { await preferences?.setString(StorageKeys.keyToken, token ?? ''); } static String getToken() => preferences?.getString(StorageKeys.keyToken) ?? ''; static void deleteToken() => preferences?.remove(StorageKeys.keyToken); static Future<void> setLanguageSelected(bool selected) async { await preferences?.setBool(StorageKeys.keyLangSelected, selected); } static bool getLanguageSelected() => preferences?.getBool(StorageKeys.keyLangSelected) ?? false; static void deleteLangSelected() => preferences?.remove(StorageKeys.keyLangSelected); static Future<void> setLanguageData(LanguageData? langData) async { final String lang = jsonEncode(langData?.toJson()); await preferences?.setString(StorageKeys.keyLanguageData, lang); } static LanguageData? getLanguage()`
*No documentation provided (generation failed).*

### `deleteLanguage() => preferences?.remove(StorageKeys.keyLanguageData); static Future<void> setSettingsList(List<SettingsData> settings) async { final List<String> strings = settings .map((setting) => jsonEncode(setting.toJson())) .toList(); await preferences?.setStringList(StorageKeys.keyGlobalSettings, strings); } static List<SettingsData> getSettingsList()`
*No documentation provided (generation failed).*

### `deleteSettingsList() => preferences?.remove(StorageKeys.keyGlobalSettings); static Future<void> setTranslations( Map<String, Object?>? translations, ) async { if (preferences != null)`
*No documentation provided (generation failed).*

### `getTranslations({String? locale})`
*No documentation provided (generation failed).*

### `deleteTranslations() => preferences?.remove(StorageKeys.keyTranslations); static Future<void> setSelectedCurrency(CurrencyData? currency) async { final String currencyString = jsonEncode(currency?.toJson()); await preferences?.setString( StorageKeys.keySelectedCurrency, currencyString, ); } static CurrencyData? getSelectedCurrency()`
*No documentation provided (generation failed).*

### `deleteSelectedCurrency() => preferences?.remove(StorageKeys.keySelectedCurrency); static Future<void> setLangLtr(bool? backward) async { await preferences?.setBool(StorageKeys.keyLangLtr, (backward ?? false)); } static bool getLangLtr() => !(preferences?.getBool(StorageKeys.keyLangLtr) ?? false); static void deleteLangLtr() => preferences?.remove(StorageKeys.keyLangLtr); static Future<void> setOnline(bool online) async { if (preferences != null)`
*No documentation provided (generation failed).*

### `getOnline()`
*No documentation provided (generation failed).*
