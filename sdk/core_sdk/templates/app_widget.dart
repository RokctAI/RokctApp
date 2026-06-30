import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:comms_sdk/comms_sdk.dart';
import 'package:${package}/core/presentation/theme/app_theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:core_sdk/src/application/app/app_provider.dart';
import 'package:${package}/core/presentation/theme/theme.dart';
import 'package:provider/provider.dart' as provider;
import 'package:core_sdk/src/presentation/components/custom_range_slider.dart';
import 'package:core_sdk/src/presentation/routes/app_router.dart';

class AppWidget extends ConsumerStatefulWidget {
  const AppWidget({super.key});

  @override
  ConsumerState<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends ConsumerState<AppWidget> {
  final appRouter = AppRouter();
  StreamSubscription? _notificationSubscription;

  @override
  void initState() {
    super.initState();
    _initNotificationListener();
  }

  void _initNotificationListener() {
    final notificationService = NotificationService();
    _notificationSubscription = notificationService.events.listen((event) {
      _handleNotificationEvent(event);
    });
  }

  void _handleNotificationEvent(NotificationEvent event) {
    switch (event.action) {
      case NotificationAction.showSnackBar:
        AppHelpers.showCheckTopSnackBar(
          context,
          type: SnackBarType.success,
          text: "${event.title} ${event.body}",
        );
        break;
      case NotificationAction.navigateToOrderProgress:
        final orderId = event.data?['id']?.toString();
        if (orderId != null) {
          context.router.pushNamed('/orderProgress', queryParameters: {'orderId': orderId});
        }
        break;
      case NotificationAction.navigateToBlog:
        final uuid = event.data?['uuid'];
        if (uuid != null) {
          launch("${AppConstants.webUrl}/blog/$uuid");
        }
        break;
      default:
        break;
    }
  }

  @override
  void dispose() {
    _notificationSubscription?.cancel();
    super.dispose();
  }

  Future fetchSetting() async {
    final connect = await AppConnectivity.connectivity();
    if (connect) {
      settingsRepository.getGlobalSettings();
      await settingsRepository.getLanguages();
      await settingsRepository.getMobileTranslations();

      await driverSettingsRepository.getGlobalSettings();
      await driverSettingsRepository.getLanguages();
      await driverSettingsRepository.getTranslations();

      managerSettingsRepository.getGlobalSettings();
      await managerSettingsRepository.getLanguages();
      await managerSettingsRepository.getTranslations();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(appProvider);
    return FutureBuilder(
      future: Future.wait([
        AppTheme.create,
        if (!Platform.isIOS) FlutterDisplayMode.setHighRefreshRate(),
        if (LocalStorage.getTranslations().isEmpty) fetchSetting(),
      ]),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        final AppTheme theme = snapshot.data?[0] ?? AppTheme.light();
        return ScreenUtilInit(
          useInheritedMediaQuery: true,
          designSize: const Size(375, 812),
          builder: (context, child) {
            return RefreshConfiguration(
              footerBuilder: () => const ClassicFooter(
                idleIcon: SizedBox.shrink(),
                idleText: "",
                loadingIcon: SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
              headerBuilder: () => WaterDropMaterialHeader(
                backgroundColor: AppStyle.white,
                color: AppStyle.primary,
              ),
              child: provider.ChangeNotifierProvider(
                create: (BuildContext context) => theme,
                child: MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  routerDelegate: appRouter.delegate(),
                  routeInformationParser: appRouter.defaultRouteParser(),
                  locale: Locale(
                    state.activeLanguage?.locale ??
                        LocalStorage.getLanguage()?.locale ??
                        'en',
                  ),
                  themeMode: ThemeMode.light,
                  theme: ThemeData(
                    useMaterial3: false,
                    sliderTheme: SliderThemeData(
                      overlayShape: SliderComponentShape.noOverlay,
                      rangeThumbShape: CustomRoundRangeSliderThumbShape(
                        enabledThumbRadius: 12.r,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}


