# API Reference: orders_page

Source file: `lib/driver/presentation/pages/orders/orders_page.dart`

## Classes

### class `DriverOrdersPage`

## Whitelisted API Endpoints

### `DriverOrdersPage({super.key}); @override ConsumerState<DriverOrdersPage> createState() => _OrdersPageState(); } class _OrdersPageState extends ConsumerState<DriverOrdersPage> with SingleTickerProviderStateMixin { late TabController _tabController; late RefreshController activeController; late RefreshController availableController; late OrderNotifier event; final _tabs = [ Tab(child: Text(AppHelpers.getTranslation(TrKeys.activeOrders))), Tab(child: Text(AppHelpers.getTranslation(TrKeys.availableOrders))), ]; @override void initState()`
*No documentation provided (generation failed).*

### `didChangeDependencies()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Scaffold(backgroundColor: AppStyle.textGrey, body: Column( children: [ CustomAppBar( bottomPadding: 16.h, child: Column( crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.end, children: [ Text( AppHelpers.getTranslation(TrKeys.orders), style: AppStyle.interSemi(size: 18.sp), ), Row( children: [ Text( AppHelpers.getTranslation(TrKeys.thereAreOrders), style: AppStyle.interRegular( size: 12.sp, letterSpacing: -0.3, ), ), Text( " ${state.totalActiveOrder} ", style: AppStyle.interRegular( size: 12.sp, letterSpacing: -0.3, ), ), Text( AppHelpers.getTranslation(TrKeys.orders).toLowerCase(), style: AppStyle.interRegular( size: 12.sp, letterSpacing: -0.3, ), ), ], ), ], ), ), 16.verticalSpace, Expanded( child: Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Column( children: [ CustomTabBar(tabController: _tabController, tabs: _tabs), Expanded( child: TabBarView( controller: _tabController, children: [ state.isActiveLoading ? const Loading() : SmartRefresher( enablePullDown: true, enablePullUp: true, onRefresh: ()`
*No documentation provided (generation failed).*

### `BouncingScrollPhysics(), itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `OrdersItem(isActiveButton: true, isOrder: true, order: state.activeOrders[index], ); }, ) : _resultEmpty(), ), state.isAvailableLoading ? const Loading() : SmartRefresher( enablePullDown: true, enablePullUp: true, onRefresh: ()`
*No documentation provided (generation failed).*

### `BouncingScrollPhysics(), itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `OrdersItem(isOrder: true, order: state.availableOrders[index], ); }, ) : _resultEmpty(), ), ], ), ), ], ), ), ), ], ), floatingActionButtonLocation: FloatingActionButtonLocation.startFloat, floatingActionButton: const PopButton(), ); } } Widget _resultEmpty()`
*No documentation provided (generation failed).*
