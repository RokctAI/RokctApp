import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:installed_apps/app_info.dart';
import 'package:launch_sdk/src/domain/interface/launch_service.dart';
import 'launch_state.dart';

class LaunchNotifier extends StateNotifier<LaunchState> {
  final ILaunchService _launchService;

  LaunchNotifier(this._launchService) : super(LaunchState()) {
    loadApps();
  }

  Future<void> loadApps() async {
    state = state.copyWith(isLoading: true);
    try {
      final apps = await _launchService.getInstalledApps();
      final sortedApps = List<AppInfo>.from(apps)
        ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      state = state.copyWith(
        allApps: sortedApps,
        filteredApps: sortedApps,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  void filterApps(String query) {
    state = state.copyWith(query: query);
    final filtered = state.allApps.where((app) {
      return app.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
    state = state.copyWith(filteredApps: filtered);
  }

  Future<void> startApp(String packageName) async {
    await _launchService.startApp(packageName);
  }

  Future<void> openAppSettings(String packageName) async {
    await _launchService.openAppSettings(packageName);
  }
}
