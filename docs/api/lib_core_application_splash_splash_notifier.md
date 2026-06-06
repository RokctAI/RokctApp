# API Reference: splash_notifier

Source file: `lib/core/application/splash/splash_notifier.dart`

## Classes

### class `SplashNotifier`

## Whitelisted API Endpoints

### `build() => const SplashState(); Future<void> getToken( BuildContext context, { VoidCallback? goMain, VoidCallback? goLogin, VoidCallback? goNoInternet, }) async { final connect = await AppConnectivity.connectivity(); if (connect)`
*No documentation provided (generation failed).*

### `Uuid().v4(); await LocalStorage.setVisitorUuid(visitorUuid); } String? appVersion; try { final packageInfo = await PackageInfo.fromPlatform(); appVersion = "${packageInfo.version} (${packageInfo.buildNumber})"; } catch (e)`
*No documentation provided (generation failed).*

### `getTranslations(BuildContext context) async { final connect = await AppConnectivity.connectivity(); if (connect)`
*No documentation provided (generation failed).*
