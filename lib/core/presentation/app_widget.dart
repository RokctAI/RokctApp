import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rokctapp/core/infrastructure/utils/services.dart';
import 'package:rokctapp/core/presentation/theme/app_theme.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rokctapp/core/application/app/app_provider.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';
import 'package:rokctapp/core/presentation/theme/app_style.dart';
import 'package:provider/provider.dart' as provider;
import 'package:rokctapp/customer/presentation/components/custom_range_slider.dart';
import 'package:rokctapp/core/presentation/routes/app_router.dart';

class AppWidget extends ConsumerWidget {
  AppWidget({super.key});

  final appRouter = AppRouter();

  Future fetchSetting() async {
    final connect = await AppConnectivity.connectivity();
    if (connect) {
      // Fetch settings for all three roles to ensure local cache is populated
      // Customer/Core
      settingsRepository.getGlobalSettings();
      await settingsRepository.getLanguages();
      await settingsRepository.getMobileTranslations();

      // Driver
      await driverSettingsRepository.getGlobalSettings();
      await driverSettingsRepository.getLanguages();
      await driverSettingsRepository.getTranslations();

      // Manager
      managerSettingsRepository.getGlobalSettings();
      await managerSettingsRepository.getLanguages();
      await managerSettingsRepository.getTranslations();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              headerBuilder: () => const WaterDropMaterialHeader(
                backgroundColor: AppStyle.white,
                color: AppStyle.primaryColor,
              ),
              child: provider.ChangeNotifierProvider(
                create: (BuildContext context) => theme,
                child: MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  routerDelegate: appRouter.delegate(),
                  routeInformationParser: appRouter.defaultRouteParser(),
                  locale: Locale(state.activeLanguage?.locale ?? LocalStorage.getLanguage()?.locale ?? 'en'),
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
