import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rokctapp/customer/application/home/home_provider.dart';
// @profile-page-imports
import 'package:users_sdk/src/application/customer/customer_profile/profile_provider.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:core_sdk/core_sdk.dart';
import 'delete_screen.dart';
import 'widgets/profile_header.dart';
import 'widgets/profile_items_list.dart';
import 'package:rokctapp/core/presentation/theme/theme_wrapper.dart';

import 'package:rokctapp/customer/presentation/components/components.dart';

@RoutePage()
class ProfilePage extends ConsumerStatefulWidget {
  final bool isBackButton;

  const ProfilePage({super.key, this.isBackButton = true});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  late RefreshController _refreshController;
  late Timer _timer;

  bool get _isAuthenticated => LocalStorage.getToken().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
    _initializeAuthenticatedUser();
  }

  void _initializeAuthenticatedUser() {
    if (_isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _fetchUserData();
        _startNotificationTimer();
      });
    }
  }

  void _fetchUserData() {
    ref.read(profileProvider.notifier).fetchUser(context);
    // @profile-page-orders-fetch
  }

  void _startNotificationTimer() {
    // @profile-page-notification-timer
  }

  void _refreshAllInformation() {
    if (!_isAuthenticated) return;

    final homeNotifier = ref.read(homeProvider.notifier);
    homeNotifier
      ..setAddress()
      ..fetchBanner(context)
      ..fetchRestaurant(context)
      ..fetchShopRecommend(context)
      ..fetchShop(context)
      ..fetchStore(context)
      ..fetchRestaurantNew(context)
      ..fetchCategories(context);

    ref.read(profileProvider.notifier).fetchUser(context);
    // @profile-page-refresh-items
  }

  void _handleRefresh() {
    ref
        .read(profileProvider.notifier)
        .fetchUser(context, refreshController: _refreshController);
    // @profile-page-refresh-orders
  }

  @override
  void dispose() {
    _refreshController.dispose();
    if (_isAuthenticated) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileProvider);
    final notificationState = ref.watch(notificationProvider);
    return CustomScaffold(
      body: (colors) => profileState.isLoading
          ? const Loading()
          : Column(
              children: [
                ProfileHeader(
                  userData: profileState.userData,
                  onLogout: () {
                    AppHelpers.showAlertDialog(
                      context: context,
                      backgroundColor: colors.backgroundColor,
                      child: DeleteScreen(
                        onDelete: () => _timer.cancel(),
                        colors: colors,
                      ),
                    );
                  },
                  colors: colors,
                ),
                Expanded(
                  child: SmartRefresher(
                    onRefresh: _handleRefresh,
                    enablePullDown: LocalStorage.getToken().isNotEmpty,
                    enablePullUp: false,
                    controller: _refreshController,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(
                        top: 24.r,
                        right: 16.r,
                        left: 16.r,
                        bottom: 120.r,
                      ),
                      child: ThemeWrapper(
                        builder: (co, controller) {
                          return ProfileItemsList(
                            isBackButton: widget.isBackButton,
                            theme: controller,
                            userData: profileState.userData,
                            notificationCount: notificationState
                                .countOfNotifications
                                ?.notification,
                            onLanguageChange: () {
                              controller.toggle();
                              controller.toggle();
                              _refreshAllInformation();
                            },
                            onDeleteAccount: () {
                              AppHelpers.showAlertDialog(
                                context: context,
                                backgroundColor: colors.backgroundColor,
                                child: DeleteScreen(
                                  isDeleteAccount: true,
                                  onDelete: () => _timer.cancel(),
                                  colors: colors,
                                ),
                              );
                            },
                            colors: colors,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: (colors) => widget.isBackButton
          ? Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: const PopButton(),
            )
          : null,
    );
  }
}
