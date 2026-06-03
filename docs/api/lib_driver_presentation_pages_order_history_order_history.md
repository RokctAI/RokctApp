# API Reference: order_history

Source file: `lib/driver/presentation/pages/order_history/order_history.dart`

## Classes

### class `DriverOrderHistoryPage`

## Whitelisted API Endpoints

### `DriverOrderHistoryPage({super.key}); @override ConsumerState<DriverOrderHistoryPage> createState() => _OrderHistoryPageState(); } class _OrderHistoryPageState extends ConsumerState<DriverOrderHistoryPage> with SingleTickerProviderStateMixin { late RefreshController historyController; late RefreshController deliveredController; late RefreshController canceledController; late RefreshController progressController; late TabController _tabController; final tabs = [ Tab(child: Text(AppHelpers.getTranslation(TrKeys.allOrders))), Tab(child: Text(AppHelpers.getTranslation(TrKeys.progressOrder))), Tab(child: Text(AppHelpers.getTranslation(TrKeys.deliveredOrder))), Tab(child: Text(AppHelpers.getTranslation(TrKeys.canceledOrder))), ]; @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Scaffold(backgroundColor: AppStyle.textGrey, body: Column( children: [ CustomAppBar( bottomPadding: 16.h, height: 110, child: Column( crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.end, children: [ Text( AppHelpers.getTranslation(TrKeys.orderHistory), style: AppStyle.interSemi(size: 18.sp), ), Text( AppHelpers.getTranslation(TrKeys.thereAreOrders), style: AppStyle.interRegular( size: 12.sp, letterSpacing: -0.3, ), ), ], ), ), 12.verticalSpace, Padding( padding: EdgeInsets.symmetric(horizontal: 12), child: CustomTabBar( tabController: _tabController, tabs: tabs, scroll: true, ), ), if (state.isHistoryLoading) const Padding(padding: EdgeInsets.only(top: 32), child: Loading()) else Expanded( child: TabBarView( controller: _tabController, children: [ AllOrdersBody(refreshController: historyController), ProgressOrdersBody(refreshController: progressController), DeliveredOrdersBody(refreshController: deliveredController), CanceledOrdersBody(refreshController: canceledController), ], ), ), ], ), floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat, floatingActionButton: Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Row( crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ const PopButton(), GestureDetector( onTap: ()`
*No documentation provided (generation failed).*
