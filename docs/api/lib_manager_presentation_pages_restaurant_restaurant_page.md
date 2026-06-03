# API Reference: restaurant_page

Source file: `lib/manager/presentation/pages/restaurant/restaurant_page.dart`

## Classes

### class `RestaurantPage`

## Whitelisted API Endpoints

### `RestaurantPage({super.key}); @override ConsumerState<RestaurantPage> createState() => _RestaurantPageState(); } class _RestaurantPageState extends ConsumerState<RestaurantPage> { final ScrollController _controller = ScrollController(); @override void initState()`
*No documentation provided (generation failed).*

### `listen(_controller)); } @override void dispose()`
*No documentation provided (generation failed).*

### `listen(_controller)); } void listen(ScrollController controller)`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Scaffold(resizeToAvoidBottomInset: false, backgroundColor: AppStyle.white, body: Stack( children: [ CustomScrollView( physics: const BouncingScrollPhysics(), controller: _controller, slivers: <Widget>[ const ShopBanner(), SliverList( delegate: SliverChildListDelegate([ Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `ListView(physics: const NeverScrollableScrollPhysics(), padding: REdgeInsets.only( right: 16, left: 16, bottom: MediaQuery.paddingOf(context).bottom, ), shrinkWrap: true, children: [ Row( children: [ Text( AppHelpers.truncate( state.shop?.translation?.title ?? LocalStorage.getShop() ?.translation ?.title ?? "", 16, ), style: AppStyle.interSemi( size: 22, color: AppStyle.blackColor, ), ), Container( width: 4.w, height: 4.h, margin: REdgeInsets.symmetric(horizontal: 8), decoration: const BoxDecoration( shape: BoxShape.circle, color: AppStyle.text, ), ), Icon( FlutterRemix.star_smile_fill, color: AppStyle.star, size: 20.r, ), 4.horizontalSpace, Text( '${LocalStorage.getShop()?.ratingAvg?.toStringAsFixed(1) ?? 0.0}', style: AppStyle.interNormal( size: 12, color: AppStyle.blackColor, ), ), const Spacer(), Container( width: 22.r, height: 22.r, decoration: const BoxDecoration( shape: BoxShape.circle, color: AppStyle.red, ), child: Icon( FlutterRemix.percent_fill, color: AppStyle.white, size: 12.r, ), ), 14.horizontalSpace, Container( width: 22.r, height: 22.r, decoration: BoxDecoration( shape: BoxShape.circle, color: AppStyle.primary, ), child: Icon( FlutterRemix.flashlight_fill, size: 16.r, color: AppStyle.buttonFont, ), ), ], ), Text( '${state.shop?.translation?.description}', style: AppStyle.interNormal( size: 13, color: AppStyle.blackColor, ), ), Container( height: 46.r, margin: EdgeInsets.only(top: 24.h, bottom: 10.h), decoration: BoxDecoration( borderRadius: BorderRadius.circular(10.r), border: Border.all( color: AppStyle.border, width: 1.r, ), ), alignment: Alignment.center, child: Row( mainAxisSize: MainAxisSize.min, children: [ Icon( FlutterRemix.time_fill, size: 20.r, color: AppStyle.blackColor, ), 10.horizontalSpace, RichText( text: TextSpan( text: AppHelpers.getTranslation( TrKeys.theRestaurantIsClosedToday, ) == AppHelpers.getShopWorkingTimeForToday() ? '' : '${AppHelpers.getTranslation(TrKeys.workingHours)}:', style: AppStyle.interRegular( color: AppStyle.blackColor, size: 12, ), children: [ TextSpan( text: ' ${AppHelpers.getShopWorkingTimeForToday()}', style: AppStyle.interSemi( color: AppStyle.blackColor, size: 13, ), ), ], ), ), ], ), ), Container( height: 74.r, decoration: BoxDecoration( borderRadius: BorderRadius.circular(10.r), border: Border.all(color: AppStyle.border), ), alignment: Alignment.center, child: Padding( padding: REdgeInsets.symmetric(horizontal: 24), child: Row( mainAxisAlignment: MainAxisAlignment.center, children: [ Icon( FlutterRemix.coins_fill, size: 45.r, color: AppStyle.blackColor, ), 10.horizontalSpace, Column( crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [ Text( AppHelpers.getTranslation( TrKeys.balance, ), style: AppStyle.interNormal( size: 14, color: AppStyle.blackColor, letterSpacing: -0.3, ), ), Text( AppHelpers.numberFormat( LocalStorage.getShop() ?.seller ?.wallet ?.price, symbol: LocalStorage.getShop() ?.seller ?.wallet ?.symbol, ), style: AppStyle.interSemi( size: 18, color: AppStyle.blackColor, letterSpacing: -0.3, ), ), ], ), const Spacer(), Container( width: 1.r, height: 46.r, color: AppStyle.blackColor.withOpacity(0.1), ), const Spacer(), Icon( FlutterRemix.bar_chart_line, size: 24.r, color: AppStyle.blackColor, ), ], ), ), ), 16.verticalSpace, _sections(context), ], ); }, ), ]), ), ], ), Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `LogoutButton(isOpen: ref.watch(restaurantProvider).shop?.open ?? false, onChange: ()`
*No documentation provided (generation failed).*

### `Column(children: [ TitleAndIcon(title: AppHelpers.getTranslation(TrKeys.sections)), 20.verticalSpace, SectionsItem( title: AppHelpers.getTranslation(TrKeys.restaurantSettings), icon: FlutterRemix.restaurant_line, onTap: () => AppHelpers.showCustomModalBottomSheet( paddingTop: MediaQuery.paddingOf(context).top + 60, context: context, modal: const EditRestaurantModal(), isDarkMode: false, ), ), SectionsItem( title: AppHelpers.getTranslation(TrKeys.income), icon: FlutterRemix.line_chart_line, onTap: () => context.pushRoute(const ManagerIncomeRoute()), ), SectionsItem( title: AppHelpers.getTranslation(TrKeys.myOrderHistory), icon: FlutterRemix.history_line, onTap: () => context.pushRoute(const ManagerOrderHistoryRoute()), ), SectionsItem( title: AppHelpers.getTranslation(TrKeys.notifications), icon: FlutterRemix.notification_2_line, onTap: () => context.pushRoute(const ManagerNotificationListRoute()), ), SectionsItem( title: AppHelpers.getTranslation(TrKeys.language), icon: FlutterRemix.translate, onTap: () => AppHelpers.showCustomModalBottomSheet( paddingTop: MediaQuery.paddingOf(context).top + 60, context: context, modal: LanguageScreen( afterUpdate: (lang)`
*No documentation provided (generation failed).*
