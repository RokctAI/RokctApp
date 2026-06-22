import 'package:auth_sdk/auth_sdk.dart' as auth_sdk;
import 'package:users_sdk/users_sdk.dart' as users_sdk;
import 'package:flutter_remix/flutter_remix.dart';
import 'package:rokctapp/core/infrastructure/firebase_service/firebase_service.dart';
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokctapp/core/infrastructure/utils/services.dart';
import 'package:rokctapp/core/presentation/theme/theme.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';
import 'package:rokctapp/core/presentation/app_widget.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:workmanager/workmanager.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dio/dio.dart';
import 'package:rokctapp/core/infrastructure/constants/app_constants.dart';
import 'package:rokctapp/driver/infrastructure/models/data/local_location_data.dart';
import 'package:rokctapp/core/infrastructure/constants/constants.dart';
import 'package:rokctapp/core/infrastructure/utils/app_helpers.dart';
import 'package:payments_sdk/payments_sdk.dart' as sdk;
import 'package:subscriptions_sdk/subscriptions_sdk.dart' as sub_sdk;

// --- Phoenix Widget for App Rebirth ---
class Phoenix extends StatefulWidget {
  final Widget child;
  const Phoenix({super.key, required this.child});
  @override
  State<Phoenix> createState() => _PhoenixState();
  static void rebirth(BuildContext context) {
    context.findAncestorStateOfType<_PhoenixState>()?.restartApp();
  }
}

class _PhoenixState extends State<Phoenix> {
  Key _key = UniqueKey();
  void restartApp() => setState(() => _key = UniqueKey());
  @override
  Widget build(BuildContext context) =>
      KeyedSubtree(key: _key, child: widget.child);
}

// --- Background Task Handling ---
const fetchBackground = "fetchBackground";

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case fetchBackground:
        await LocalStorage.init();
        if (LocalStorage.getToken().isEmpty) return Future.value(true);

        try {
          Position userLocation = await Geolocator.getCurrentPosition(
            // ignore: deprecated_member_use
            desiredAccuracy: LocationAccuracy.high,
          );

          final Dio client = Dio(
            BaseOptions(
              baseUrl: AppConstants.baseUrl,
              connectTimeout: const Duration(seconds: 30),
              receiveTimeout: const Duration(seconds: 30),
              headers: {
                'Accept':
                    'application/json, application/geo+json, application/gpx+xml, img/png; charset=utf-8',
                'Content-type': 'application/json',
                "Authorization": "Bearer ${LocalStorage.getToken()}",
              },
            ),
          )..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

          await client.post(
            '/api/v1/dashboard/deliveryman/settings/location',
            data: {
              "location": LocalLocationData(
                latitude: userLocation.latitude,
                longitude: userLocation.longitude,
              ).toJson(),
            },
          );
        } catch (e) {
          debugPrint('===> Background location update failed: $e');
        }
        break;
    }
    return Future.value(true);
  });
}

// --- Firebase Messaging ---
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

// --- Main Entry Point ---
void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await LocalStorage.init();
  setUpDependencies();

  // Global Exception Handlers reporting to the Tenant backend
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    try {
      settingsRepository.reportClientError(
        "Flutter Uncaught Error: ${details.exception}",
        details.stack.toString(),
      );
    } catch (e) {
      debugPrint("==> failed to report Flutter error: $e");
    }
  };

  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    try {
      settingsRepository.reportClientError(
        "Platform Uncaught Error: $error",
        stack.toString(),
      );
    } catch (e) {
      debugPrint("==> failed to report Platform error: $e");
    }
    return true;
  };

  // Initialize Background Tasks
  await Workmanager().initialize(callbackDispatcher);
  Workmanager().registerPeriodicTask(
    'location_update',
    fetchBackground,
    frequency: const Duration(
      minutes: 15,
    ), // Minimum frequency for background tasks
  );

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: SystemUiOverlay.values,
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppStyle.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );

  runApp(
    ProviderScope(
      overrides: [
        auth_sdk.authRepositoryProvider.overrideWithValue(
          authRepository as auth_sdk.AuthRepositoryFacade,
        ),
        auth_sdk.isPhoneFirebaseProvider.overrideWithValue(
          AppConstants.isPhoneFirebase,
        ),
        auth_sdk.getFlavorProvider.overrideWithValue(
          () => AppConstants.flavor.name,
        ),
        auth_sdk.firebaseSocialLoginProvider.overrideWithValue((
          context,
          icon,
        ) async {
          if (icon == FlutterRemix.google_fill) {
            final res = await FirebaseService.socialGoogle();
            return res.fold((l) => l, (r) {
              AppHelpers.showCheckTopSnackBar(context, r.toString());
              return null;
            });
          } else if (icon == FlutterRemix.apple_fill) {
            final res = await FirebaseService.socialApple();
            return res.fold((l) => l, (r) {
              AppHelpers.showCheckTopSnackBar(context, r.toString());
              return null;
            });
          } else if (icon == FlutterRemix.facebook_fill) {
            final res = await FirebaseService.socialFacebook();
            return res.fold((l) => l, (r) {
              AppHelpers.showCheckTopSnackBar(context, r.toString());
              return null;
            });
          }
          return null;
        }),
        auth_sdk.firebaseSendOtpProvider.overrideWithValue(({
          required phone,
          required onSuccess,
          required onError,
        }) async {
          await FirebaseService.sendCode(
            phone: phone,
            onSuccess: onSuccess,
            onError: onError,
          );
        }),
        auth_sdk.firebaseVerifyPhoneProvider.overrideWithValue(({
          required context,
          required smsCode,
          required verificationId,
          required onSuccess,
          required onError,
        }) async {
          final res = await FirebaseService.checkCode(
            verificationId: verificationId,
            code: smsCode,
          );
          res.when(
            success: (data) => onSuccess(),
            failure: (err, _) => onError(err.toString()),
          );
        }),
        auth_sdk.authNavigationProvider.overrideWithValue((context, user) {
          appRouter.pushPath('/main');
        }),
        auth_sdk.fetchMyShopProvider.overrideWithValue(({
          required afterFetched,
        }) {
          afterFetched();
        }),
        users_sdk.userRepositoryProvider.overrideWithValue(
          userRepository as users_sdk.UserRepositoryFacade,
        ),
        users_sdk.settingsRepositoryProvider.overrideWithValue(
          settingsRepository,
        ),
        users_sdk.logoutNavigationProvider.overrideWithValue((context) {
          appRouter.pushPath('/login');
        }),
        users_sdk.getSelectedCurrencyProvider.overrideWithValue(
          () => LocalStorage.getSelectedCurrency(),
        ),
        users_sdk.logoutStorageProvider.overrideWithValue(() async {
          LocalStorage.logout();
        }),
        users_sdk.galleryRepositoryProvider.overrideWithValue(
          galleryRepository,
        ),
        users_sdk.shopsRepositoryProvider.overrideWithValue(shopsRepository),

        sdk.paymentsRepositoryProvider.overrideWithValue(
          managerPaymentRepositoryNew,
        ),
        sdk.connectivityProvider.overrideWithValue(
          AppConnectivity.connectivity,
        ),
        sdk.snackBarProvider.overrideWithValue(
          (context, message) =>
              AppHelpers.showCheckTopSnackBar(context, message),
        ),
        sdk.noConnectionSnackBarProvider.overrideWithValue(
          AppHelpers.showNoConnectionSnackBar,
        ),
        sdk.translationProvider.overrideWithValue(AppHelpers.getTranslation),
        sub_sdk.subscriptionProvider.overrideWith((ref) {
          return sub_sdk.SubscriptionNotifier(
            managerSubscriptionRepository,
            managerPaymentRepositoryNew,
            getWalletPrice: () => LocalStorage.getUser()?.wallet?.price ?? 0,
            onNavigateToWebView: (context, url) async {
              await appRouter.push(null as dynamic);
            },
            onError: (context, message) {
              AppHelpers.showCheckTopSnackBar(context, message);
            },
            getTranslation: (key) => AppHelpers.getTranslation(key) as dynamic,
          );
        }),
      ],
      child: Phoenix(child: AppWidget()),
    ),
  );
}
