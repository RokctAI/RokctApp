import 'package:installed_apps/app_info.dart';

abstract class ILaunchService {
  Future<List<AppInfo>> getInstalledApps({
    bool excludeSystemApps = false,
    bool excludeNonLaunchableApps = true,
    bool withIcon = false,
  });

  Future<void> startApp(String packageName);
  Future<void> openAppSettings(String packageName);
}
