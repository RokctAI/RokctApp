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
  Widget build(BuildContext context) => KeyedSubtree(key: _key, child: widget.child);
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
              headers: {
                'Accept': 'application/json, application/geo+json, application/gpx+xml, img/png; charset=utf-8',
                'Content-type': 'application/json',
                "Authorization": "Bearer ${LocalStorage.getToken()}",
              },
            ),
          )..interceptors.add(
              LogInterceptor(requestBody: true, responseBody: true),
            );

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

  // Initialize Background Tasks
  await Workmanager().initialize(callbackDispatcher);
  Workmanager().registerPeriodicTask(
    'location_update',
    fetchBackground,
    frequency: const Duration(minutes: 15), // Minimum frequency for background tasks
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
    const ProviderScope(
      child: Phoenix(
        child: AppWidget(),
      ),
    ),
  );
}
