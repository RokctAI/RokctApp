# API Reference: splash_notifier

Source file: `lib/driver/application/splash/splash_notifier.dart`

## Classes

### class `SplashNotifier`

## Whitelisted API Endpoints

### `SplashState()); Future<void> fetchDriverDetails({required BuildContext context}) async { final response = await _userRepository.getDriverDetails(); response.when( success: (data)`
*No documentation provided (generation failed).*

### `fetchGlobalSettings(BuildContext context) async { final response = await _settingsRepository.getGlobalSettings(); response.when( success: (data)`
*No documentation provided (generation failed).*

### `fetchCurrencies(BuildContext context) async { final response = await _settingsRepository.getCurrencies(); response.when( success: (data)`
*No documentation provided (generation failed).*

### `fetchProfileDetails(BuildContext context, { VoidCallback? onMain, VoidCallback? onBecome, VoidCallback? onLogin, }) async { final response = await _userRepository.getProfileDetails(); response.when( success: (data)`
*No documentation provided (generation failed).*

### `SplashRoute()); return; } AppHelpers.showCheckTopSnackBar( context, AppHelpers.getTranslation(failure), ); debugPrint('==> error fetching profile details $failure'); }, ); } Future<void> fetchTranslations({ required BuildContext context, VoidCallback? noConnection, VoidCallback? goMain, VoidCallback? goLogin, VoidCallback? onBecome, Function(DeliveryResponse?)? setDriverData, }) async { if (await AppConnectivity.connectivity())`
*No documentation provided (generation failed).*
