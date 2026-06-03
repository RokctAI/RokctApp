# API Reference: profile_page

Source file: `lib/driver/presentation/pages/profile/profile_page.dart`

## Classes

### class `DriverProfilePage`

## Whitelisted API Endpoints

### `DriverProfilePage({super.key}); @override ConsumerState<DriverProfilePage> createState() => _ProfilePageState(); } class _ProfilePageState extends ConsumerState<DriverProfilePage> { final bool isLtr = LocalStorage.getLangLtr(); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: Scaffold( backgroundColor: AppStyle.textGrey, resizeToAvoidBottomInset: false, body: Column( children: [ CustomAppBar( bottomPadding: 4.h, child: Row( crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.start, children: [ Hero( tag: AppConstants.heroTagProfileAvatar, child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `DriverAvatar(imageUrl: LocalStorage.getUser()?.img, rate: LocalStorage.getUser()?.rate, ); }, ), ), 10.horizontalSpace, Padding( padding: EdgeInsets.only(bottom: 24.h), child: Column( crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.end, children: [ Text( '${LocalStorage.getUser()?.firstname ?? ''} ${LocalStorage.getUser()?.lastname ?? ''}', style: AppStyle.interSemi(size: 16.sp), ), Text( LocalStorage.getUser()?.phone ?? '', style: AppStyle.interRegular(size: 12.sp), ), ], ), ), const Spacer(), Padding( padding: EdgeInsets.only(bottom: 24.h), child: ButtonsBouncingEffect( child: GestureDetector( onTap: ()`
*No documentation provided (generation failed).*

### `LogoutModal(), isDarkMode: LocalStorage.getAppThemeMode(), ); }, child: Icon( FlutterRemix.logout_circle_r_line, size: 24.r, color: AppStyle.black, ), ), ), ), ], ), ), Expanded( child: ListView( padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h), shrinkWrap: true, physics: const BouncingScrollPhysics(), children: [ Container( decoration: BoxDecoration( color: AppStyle.white, borderRadius: BorderRadius.circular(10.r), ), padding: EdgeInsets.all(12.r), child: IntrinsicHeight( child: Row( children: [ SvgPicture.asset(Assets.svgBalance), 10.horizontalSpace, Expanded( child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text( AppHelpers.getTranslation(TrKeys.balance), style: AppStyle.interNormal( size: 12.sp, letterSpacing: -0.3, ), ), Text( AppHelpers.numberFormat( number: LocalStorage.getUser()?.wallet?.price, maxLength: 8, ), style: AppStyle.interSemi( size: 14.sp, letterSpacing: -0.3, ), maxLines: 2, ), ], ), ), const VerticalDivider(color: AppStyle.border), 10.horizontalSpace, Expanded( child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text( AppHelpers.getTranslation(TrKeys.lastProfit), style: AppStyle.interNormal( size: 12.sp, letterSpacing: -0.3, ), ), Text( AppHelpers.numberFormat( number: ref .watch(profileSettingsProvider) .statistics ?.data ?.totalPrice ?? 0, ), style: AppStyle.interSemi( size: 14.sp, letterSpacing: -0.3, color: AppStyle.primary, ), ), ], ), ), 32.horizontalSpace, ], ), ), ), 10.verticalSpace, Container( decoration: BoxDecoration( color: AppStyle.white, borderRadius: BorderRadius.circular(10.r), ), padding: EdgeInsets.all(12.r), child: Row( children: [ Icon(FlutterRemix.checkbox_circle_fill, size: 30.r), 10.horizontalSpace, Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text( AppHelpers.getTranslation(TrKeys.deliveredOrder), style: AppStyle.interNormal( size: 12.sp, letterSpacing: -0.3, ), ), Text( (state.statistics?.data?.deliveredOrdersCount ?? 0) .toString(), style: AppStyle.interSemi( size: 14.sp, letterSpacing: -0.3, ), ), ], ), const Spacer(), 10.horizontalSpace, 24.horizontalSpace, ], ), ), 20.verticalSpace, SectionsItem( title: AppHelpers.getTranslation(TrKeys.profileSettings), icon: FlutterRemix.user_settings_line, onTap: ()`
*No documentation provided (generation failed).*

### `EditProfileModal(), isDarkMode: false, isExpanded: true, ); }, ), SectionsItem( title: AppHelpers.getTranslation(TrKeys.deliveryZone), icon: FlutterRemix.navigation_fill, onTap: () async { await context.pushRoute(const DriverDeliveryZoneRoute()); ref .read(homeProvider.notifier) .fetchDeliveryZone(isFetch: true); }, ), SectionsItem( title: AppHelpers.getTranslation(TrKeys.orders), icon: FlutterRemix.order_play_line, onTap: ()`
*No documentation provided (generation failed).*

### `DriverOrdersRoute()); }, ), SectionsItem( title: AppHelpers.getTranslation(TrKeys.parcels), icon: FlutterRemix.archive_line, onTap: ()`
*No documentation provided (generation failed).*

### `DriverParcelsRoute()); }, ), SectionsItem( title: AppHelpers.getTranslation(TrKeys.notifications), icon: FlutterRemix.notification_2_line, onTap: () => context.pushRoute(const DriverNotificationListRoute()), ), SectionsItem( title: AppHelpers.getTranslation(TrKeys.orderHistory), icon: FlutterRemix.history_line, onTap: ()`
*No documentation provided (generation failed).*

### `DriverOrderHistoryRoute()); }, ), SectionsItem( title: AppHelpers.getTranslation(TrKeys.parcelHistory), icon: FlutterRemix.folder_history_fill, onTap: ()`
*No documentation provided (generation failed).*

### `DriverParcelHistoryRoute()); }, ), SectionsItem( title: AppHelpers.getTranslation(TrKeys.income), icon: FlutterRemix.line_chart_line, onTap: ()`
*No documentation provided (generation failed).*

### `DriverIncomeRoute()); }, ), Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `SectionsItem(title: AppHelpers.getTranslation(TrKeys.language), icon: FlutterRemix.global_line, onTap: ()`
*No documentation provided (generation failed).*
