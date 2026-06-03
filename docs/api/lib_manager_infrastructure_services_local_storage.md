# API Reference: local_storage

Source file: `lib/manager/infrastructure/services/local_storage.dart`

## Classes

### class `LocalStorage`

## Whitelisted API Endpoints

### `getSubscription()`
*No documentation provided (generation failed).*

### `init() async => CoreLocalStorage.init(); static Future<void> setToken(String? token) async => CoreLocalStorage.setToken(token); static Future<void> setAddressSelected(AddressData data) async { if (CoreLocalStorage.preferences != null)`
*No documentation provided (generation failed).*

### `setWalletData(Wallet? wallet) async { if (CoreLocalStorage.preferences != null)`
*No documentation provided (generation failed).*

### `getToken() => CoreLocalStorage.getToken(); static void _deleteToken() => CoreLocalStorage.deleteToken(); static Future<void> setLanguageSelected(bool selected) async => CoreLocalStorage.setLanguageSelected(selected); static bool getLanguageSelected() => CoreLocalStorage.getLanguageSelected(); static Future<void> setSettingsList(List<SettingsData> settings) async => CoreLocalStorage.setSettingsList(settings); static List<SettingsData> getSettingsList() => CoreLocalStorage.getSettingsList(); static Future<void> setTranslations( Map<String, Dyn>? translations, ) async => CoreLocalStorage.setTranslations(translations); static Map<String, Dyn> getTranslations({String? locale}) => CoreLocalStorage.getTranslations(locale: locale); static Future<void> setAppThemeMode(bool isDarkMode) async { if (CoreLocalStorage.preferences != null)`
*No documentation provided (generation failed).*

### `getAppThemeMode() => CoreLocalStorage.preferences?.getBool(StorageKeys.keyAppThemeMode) ?? false; static Future<void> setLanguageData(LanguageData? langData) async => CoreLocalStorage.setLanguageData(langData); static LanguageData? getLanguage() => CoreLocalStorage.getLanguage(); static Future<void> setActiveLanguages(List<LanguageData> languages) async { if (CoreLocalStorage.preferences != null)`
*No documentation provided (generation failed).*

### `jsonEncode(language.toJson())) .toList(); await CoreLocalStorage.preferences!.setStringList( StorageKeys.keyActiveLanguages, strings, ); } } static List<LanguageData> getActiveLanguages()`
*No documentation provided (generation failed).*

### `setLangLtr(bool? backward) async => CoreLocalStorage.setLangLtr(backward); static bool getLangLtr() => CoreLocalStorage.getLangLtr(); static Future<void> setSelectedCurrency(CurrencyData? currency) async => CoreLocalStorage.setSelectedCurrency(currency); static CurrencyData? getSelectedCurrency() => CoreLocalStorage.getSelectedCurrency(); static Future<void> setUser(UserData? user) async { if (CoreLocalStorage.preferences != null)`
*No documentation provided (generation failed).*

### `logout()`
*No documentation provided (generation failed).*
