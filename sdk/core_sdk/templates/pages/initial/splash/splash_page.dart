import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:core_sdk/core_sdk.dart';
import 'package:auth_sdk/auth_sdk.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';




@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _initializeApp();
    });
  }

  Future<void> _initializeApp() async {
    try {
      // First, check if app is in maintenance mode
      if (AppConstants.isMaintain) {
        if (!mounted) return;
        FlutterNativeSplash.remove();
        context.router.replaceNamed('/ClosedPage');
        return;
      }

      // Check connectivity first
      final hasConnection = await _checkConnectivity();

      if (!hasConnection) {
        // No internet - check if we have offline data to continue
        final hasOfflineData = _hasRequiredOfflineData();

        if (hasOfflineData) {
          // We have enough offline data, proceed offline
          await _proceedOffline();
        } else {
          // No offline data and no internet - show no connection page
          FlutterNativeSplash.remove();
          if (!mounted) return;
          context.router.replaceNamed('/no-connection');
          return;
        }
      } else {
        // Has internet - proceed with normal flow
        await _proceedOnline();
      }
    } catch (e) {
      // Error occurred - check if we can proceed offline
      final hasOfflineData = _hasRequiredOfflineData();
      if (hasOfflineData) {
        await _proceedOffline();
      } else {
        FlutterNativeSplash.remove();
        if (!mounted) return;
        context.router.replaceNamed('/no-connection');
      }
    }
  }

  Future<bool> _checkConnectivity() async {
    return await AppConnectivity.connectivity();
  }

  bool _hasRequiredOfflineData() {
    // Check if we have essential offline data
    final translations = LocalStorage.getTranslations();
    final settings = LocalStorage.getSettingsList();

    // Return true if we have basic data to run the app offline
    return translations.isNotEmpty || settings.isNotEmpty;
  }

  Future<void> _proceedOnline() async {
    try {
      // Load translations first
      await ref.read(splashProvider.notifier).getTranslations(context);

      if (!mounted) return;
      // Then check authentication
      ref
          .read(splashProvider.notifier)
          .getToken(
            context,
            goMain: () {
              FlutterNativeSplash.remove();
              if (!mounted) return;
              AppHelpers.goHome(context);
            },
            goLogin: () {
              FlutterNativeSplash.remove();
              if (!mounted) return;
              context.router.replaceNamed('/login');
            },
            goNoInternet: () {
              FlutterNativeSplash.remove();
              if (!mounted) return;
              context.router.replaceNamed('/no-connection');
            },
          );
    } catch (e) {
      // If online flow fails, try offline
      await _proceedOffline();
    }
  }

  Future<void> _proceedOffline() async {
    // Add a small delay to show splash screen
    await Future.delayed(const Duration(seconds: 2));

    // Check if user was previously logged in
    final token = LocalStorage.getToken();

    FlutterNativeSplash.remove();

    if (token.isNotEmpty) {
      // User was logged in, go to main page
      if (!mounted) return;
      AppHelpers.goHome(context);
    } else {
      // User not logged in, go to login
      if (!mounted) return;
      context.router.replaceNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Ensure background color for dark theme
      body: SizedBox.expand(
        child: Image.asset("assets/images/splash.png", fit: BoxFit.fill),
      ),
    );
  }
}
