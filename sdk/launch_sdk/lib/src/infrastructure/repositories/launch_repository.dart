import 'package:installed_apps/installed_apps.dart';
import 'package:installed_apps/app_info.dart';
import 'package:launch_sdk/src/domain/interface/launch_service.dart';

class LaunchRepository implements ILaunchService {
  @override
  Future<List<AppInfo>> getInstalledApps({
    bool excludeSystemApps = false,
    bool excludeNonLaunchableApps = true,
    bool withIcon = false,
  }) async {
    return await InstalledApps.getInstalledApps(
      excludeSystemApps: excludeSystemApps,
      excludeNonLaunchableApps: excludeNonLaunchableApps,
      withIcon: withIcon,
    );
  }

  @override
  Future<void> startApp(String packageName) async {
    await InstalledApps.startApp(packageName);
  }

  @override
  Future<void> openAppSettings(String packageName) async {
    await InstalledApps.openSettings(packageName);
  }
}
