# API Reference: profile_items_list

Source file: `lib/customer/presentation/pages/profile/widgets/profile_items_list.dart`

## Classes

### class `ProfileItemsList`

## Whitelisted API Endpoints

### `ProfileItemsList({ super.key, required this.isBackButton, required this.userData, required this.notificationCount, required this.onLanguageChange, required this.onDeleteAccount, required this.theme, required this.colors, }); bool get _isAuth => LocalStorage.getToken().isNotEmpty; @override Widget build(BuildContext context, WidgetRef ref)`
*No documentation provided (generation failed).*

### `Column(children: [ ProfileItemTwo( colors: colors, title: AppHelpers.getTranslation(TrKeys.darkMode), icon: theme.isDark ? Icons.light_mode : Icons.dark_mode_outlined, onTap: ()`
*No documentation provided (generation failed).*

### `EditProfileScreen(controller: c), isDarkMode: theme.isDark, ); }, ), ProfileItem( colors: colors, title: "${AppHelpers.getTranslation(TrKeys.wallet)}: ${AppHelpers.numberFormat(userData?.wallet?.price)}", icon: FlutterRemix.wallet_3_line, onTap: () => context.pushRoute(const WalletHistoryRoute()), ), if (AppHelpers.getReferralActive()) ProfileItem( colors: colors, title: TrKeys.inviteFriend, icon: FlutterRemix.money_dollar_circle_line, onTap: () => context.pushRoute(const ShareReferralRoute()), ), ProfileItem( colors: colors, title: TrKeys.order, icon: FlutterRemix.history_line, isCount: true, count: ref.watch(ordersListProvider).totalActiveCount.toString(), onTap: () => context.pushRoute(const OrdersListRoute()), ), if (AppHelpers.getParcel()) ProfileItem( colors: colors, title: TrKeys.parcels, icon: FlutterRemix.archive_line, isCount: true, count: ref.watch(parcelListProvider).totalActiveCount.toString(), onTap: () => context.pushRoute(const ParcelListRoute()), ), ProfileItem( colors: colors, title: TrKeys.notifications, icon: FlutterRemix.notification_2_line, isCount: true, count: (notificationCount ?? 0).toString(), onTap: () => context.pushRoute(const NotificationListRoute()), ), if (AppHelpers.getReservationEnable()) ProfileItem( colors: colors, title: TrKeys.reservation, icon: FlutterRemix.reserved_line, onTap: () => AppHelpers.showAlertDialog( context: context, backgroundColor: theme.colors.backgroundColor, child: SizedBox(child: ReservationShops(colors: theme.colors)), ), ), ProfileItem( colors: colors, title: TrKeys.deliveryAddress, icon: FlutterRemix.user_location_line, onTap: () => context.pushRoute(const AddressListRoute()), ), ], if (isBackButton) ProfileItem( colors: colors, title: TrKeys.liked, icon: FlutterRemix.heart_3_line, onTap: () => context.pushRoute(LikeRoute()), ), if (_isAuth) ProfileItem( colors: colors, title: TrKeys.becomeSeller, icon: FlutterRemix.user_star_line, onTap: () => context.pushRoute(const CreateShopRoute()), ), if (_isAuth) ProfileItem( colors: colors, title: TrKeys.chatWithAdmin, icon: FlutterRemix.chat_1_line, onTap: () => context.pushRoute(ChatRoute(roleId: "admin", name: "Admin")), ), ProfileItem( colors: colors, title: TrKeys.language, icon: FlutterRemix.global_line, onTap: () => AppHelpers.showCustomModalBottomSheet( isDismissible: true, context: context, modal: LanguageScreen( onSave: ()`
*No documentation provided (generation failed).*
