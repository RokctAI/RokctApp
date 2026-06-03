# API Reference: splash_notifier

Source file: `lib/manager/application/splash/splash_notifier.dart`

## Classes

### class `SplashNotifier`

## Whitelisted API Endpoints

### `SplashState()); Future<void> fetchCurrencies() async { final response = await _settingsRepository.getCurrencies(); response.when( success: (data)`
*No documentation provided (generation failed).*

### `fetchProfileDetails({ required VoidCallback? goMain, required VoidCallback? goBecome, required VoidCallback? goLogin, }) async { final response = await _userRepository.getProfileDetails(); response.when( success: (data)`
*No documentation provided (generation failed).*

### `fetchGlobalSettings() async { final response = await _settingsRepository.getGlobalSettings(); response.when( success: (data)`
*No documentation provided (generation failed).*

### `getActiveLanguages(BuildContext context, { VoidCallback? goMain, VoidCallback? goLogin, }) async { final connect = await AppConnectivity.connectivity(); if (connect)`
*No documentation provided (generation failed).*

### `fetchTranslations({ VoidCallback? noConnection, VoidCallback? goMain, VoidCallback? goLogin, VoidCallback? goBecome, }) async { if (await AppConnectivity.connectivity())`
*No documentation provided (generation failed).*
