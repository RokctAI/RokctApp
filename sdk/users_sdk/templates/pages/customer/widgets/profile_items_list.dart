import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core_sdk/core_sdk.dart';
// @profile-orders-imports
import 'package:core_sdk/src/models/models.dart';
import 'package:core_sdk/core_sdk.dart';
// @profile-viewport-imports
import '../edit_profile_page.dart';
import '../language_page.dart';
import '../currency_page.dart';
import 'profile_item_two.dart';
import 'package:core_sdk/src/presentation/routes/app_router.dart';
import 'package:${package}/core/presentation/theme/app_theme.dart';
import 'package:${package}/core/presentation/theme/color_set.dart';
import 'profile_item.dart';

class ProfileItemsList extends ConsumerWidget {
  final bool isBackButton;
  final ProfileData? userData;
  final int? notificationCount;
  final VoidCallback onLanguageChange;
  final VoidCallback onDeleteAccount;
  final AppTheme theme;
  final CustomColorSet colors;

  const ProfileItemsList({
    super.key,
    required this.isBackButton,
    required this.userData,
    required this.notificationCount,
    required this.onLanguageChange,
    required this.onDeleteAccount,
    required this.theme,
    required this.colors,
  });

  bool get _isAuth => LocalStorage.getToken().isNotEmpty;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ProfileItemTwo(
          colors: colors,
          title: AppHelpers.getTranslation(TrKeys.darkMode),
          icon: theme.isDark ? Icons.light_mode : Icons.dark_mode_outlined,
          onTap: () {},
          prefixWidget: SizedBox(
            height: 20,
            child: Switch(
              activeThumbColor: colors.primary,
              value: theme.isDark,
              onChanged: (value) {
                theme.toggle();
              },
            ),
          ),
        ),
        if (AppConstants.isDemo)
          ProfileItem(
            colors: colors,
            title: TrKeys.uiType,
            icon: FlutterRemix.typhoon_line,
            onTap: () => context.pushRoute(UiTypeRoute(isBack: true)),
          ),

        if (_isAuth) ...[
          ProfileItem(
            colors: colors,
            title: TrKeys.profileSettings,
            icon: FlutterRemix.user_settings_line,
            onTap: () {
              AppHelpers.showCustomModalBottomDragSheet(
                context: context,
                modal: (c) => EditProfileScreen(controller: c),
                isDarkMode: theme.isDark,
              );
            },
          ),

          // @profile-wallet-item

          // @profile-referral-item
          
          // @profile-orders-item

          // @profile-parcels-item

          // @profile-notification-item

          // @profile-reservation-item

          ProfileItem(
            colors: colors,
            title: TrKeys.deliveryAddress,
            icon: FlutterRemix.user_location_line,
            onTap: () => context.pushRoute(const AddressListRoute()),
          ),
        ],

        if (isBackButton)
          // @profile-liked-item

        if (_isAuth)
          // @profile-become-seller-item

        if (_isAuth)
          // @profile-become-driver-item

        // @profile-chat-item

        ProfileItem(
          colors: colors,
          title: TrKeys.language,
          icon: FlutterRemix.global_line,
          onTap: () => AppHelpers.showCustomModalBottomSheet(
            isDismissible: true,
            context: context,
            modal: LanguageScreen(
              onSave: () {
                if (context.mounted) {
                  Navigator.pop(context);
                }
                onLanguageChange();
              },
              colors: theme.colors,
            ),
            isDarkMode: theme.isDark,
          ),
        ),

        ProfileItem(
          colors: colors,
          title: TrKeys.currencies,
          icon: FlutterRemix.bank_card_line,
          onTap: () => AppHelpers.showCustomModalBottomSheet(
            context: context,
            modal: CurrencyScreen(colors: theme.colors),
            isDarkMode: theme.isDark,
          ),
        ),

        // @profile-legal-help-item

        if (_isAuth)
          ProfileItem(
            colors: colors,
            title: TrKeys.setting,
            icon: FlutterRemix.settings_4_line,
            onTap: () => context.pushRoute(const SettingRoute()),
          ),

        ProfileItem(
          colors: colors,
          title: TrKeys.about,
          icon: FlutterRemix.bill_line,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AboutPage()),
          ),
        ),

        // @profile-careers-item

        // @profile-blogs-item

        // @profile-legal-policy-items

        if (_isAuth)
          ProfileItem(
            colors: colors,
            title: TrKeys.deleteAccount,
            icon: FlutterRemix.logout_box_r_line,
            onTap: onDeleteAccount,
          ),
      ],
    );
  }
}

