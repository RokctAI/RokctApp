# API Reference: local_storage

Source file: `lib/driver/infrastructure/services/local_storage.dart`

## Classes

### class `LocalStorage`

## Whitelisted API Endpoints

### `init() async => CoreLocalStorage.init(); static Future<void> setToken(String? token) async => CoreLocalStorage.setToken(token); static String getToken() => CoreLocalStorage.getToken(); static void _deleteToken() => CoreLocalStorage.deleteToken(); static Future<void> setLanguageSelected(bool selected) async => CoreLocalStorage.setLanguageSelected(selected); static bool getLanguageSelected() => CoreLocalStorage.getLanguageSelected(); static void deleteLangSelected() => CoreLocalStorage.deleteLangSelected(); static Future<void> setSettingsList(List<SettingsData> settings) async => CoreLocalStorage.setSettingsList(settings); static List<SettingsData> getSettingsList() => CoreLocalStorage.getSettingsList(); static Future<void> setTranslations(Map<String, Dyn>? translations) async => CoreLocalStorage.setTranslations(translations); static Map<String, Dyn> getTranslations() => CoreLocalStorage.getTranslations(); static Future<void> setAppThemeMode(bool isDarkMode) async { if (CoreLocalStorage.preferences != null)`
*No documentation provided (generation failed).*

### `getAppThemeMode() => CoreLocalStorage.preferences?.getBool(StorageKeys.keyAppThemeMode) ?? false; static Future<void> setLanguageData(LanguageData? langData) async => CoreLocalStorage.setLanguageData(langData); static LanguageData? getLanguage() => CoreLocalStorage.getLanguage(); static Future<void> setLangLtr(bool? backward) async => CoreLocalStorage.setLangLtr(backward); static bool getLangLtr() => CoreLocalStorage.getLangLtr(); static Future<void> setSelectedCurrency(CurrencyData? currency) async => CoreLocalStorage.setSelectedCurrency(currency); static CurrencyData? getSelectedCurrency() => CoreLocalStorage.getSelectedCurrency(); static Future<void> setAddressSelected(LatLng data) async { if (CoreLocalStorage.preferences != null)`
*No documentation provided (generation failed).*

### `setUser(UserData? user) async { if (CoreLocalStorage.preferences != null)`
*No documentation provided (generation failed).*

### `getOnline()`
*No documentation provided (generation failed).*
