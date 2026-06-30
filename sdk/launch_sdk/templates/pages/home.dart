import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remixicon/remixicon.dart';
import 'package:launch_sdk/launch_sdk.dart';
import 'package:users_sdk/src/application/customer/profile/profile_provider.dart';
import 'package:users_sdk/users_sdk.dart';
import 'package:auto_route/auto_route.dart';
import 'widgets/app_item.dart';
// @launcher-glance-imports
// @launcher-user-avatar-imports

class LauncherHomePage extends ConsumerWidget {
  const LauncherHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ThemeWrapper(
      builder: (colors, theme) {
        final state = ref.watch(launchProvider);
        final profileState = ref.watch(profileProvider);
        final notifier = ref.read(launchProvider.notifier);
        final searchController = TextEditingController();

        final userData = profileState.userData;
        final bool isLoggedIn = userData != null;

        return Scaffold(
          backgroundColor: theme.isDark ? AppStyle.blackColor : AppStyle.white,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      // @launcher-user-avatar
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () => theme.toggle(),
                        child: Icon(
                          theme.isDark ? RemixIcons.sun_line : RemixIcons.moon_line,
                          color: theme.isDark ? AppStyle.white : AppStyle.blackColor,
                          size: 24.r,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SearchTextField(
                          textEditingController: searchController,
                          onChanged: (value) => notifier.filterApps(value),
                          hintText: 'Search apps...',
                          bgColor: theme.isDark ? AppStyle.bgDark : AppStyle.bgGrey,
                        ),
                      ),
                    ],
                  ),
                ),
                // @launcher-glance
                Expanded(
                  child: state.isLoading
                      ? Loading(color: theme.isDark ? AppStyle.white : AppStyle.blackColor)
                      : state.filteredApps.isEmpty
                          ? const Center(
                              child: Text(
                                'No apps found',
                                style: TextStyle(color: AppStyle.text),
                              ),
                            )
                          : ListView.builder(
                              itemCount: state.filteredApps.length,
                              itemBuilder: (context, index) {
                                final app = state.filteredApps[index];
                                return LauncherAppItem(
                                  app: app,
                                  onTap: () => notifier.startApp(app.packageName),
                                  onLongPress: () =>
                                      notifier.openAppSettings(app.packageName),
                                );
                              },
                            ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}

}
