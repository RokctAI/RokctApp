import 'package:installed_apps/app_info.dart';

class LaunchState {
  final List<AppInfo> allApps;
  final List<AppInfo> filteredApps;
  final bool isLoading;
  final String query;

  LaunchState({
    this.allApps = const [],
    this.filteredApps = const [],
    this.isLoading = true,
    this.query = '',
  });

  LaunchState copyWith({
    List<AppInfo>? allApps,
    List<AppInfo>? filteredApps,
    bool? isLoading,
    String? query,
  }) {
    return LaunchState(
      allApps: allApps ?? this.allApps,
      filteredApps: filteredApps ?? this.filteredApps,
      isLoading: isLoading ?? this.isLoading,
      query: query ?? this.query,
    );
  }
}
