# API Reference: orders_page

Source file: `lib/customer/presentation/pages/order/orders_page.dart`

## Classes

### class `OrdersListPage`

## Whitelisted API Endpoints

### `OrdersListPage({super.key}); @override ConsumerState<OrdersListPage> createState() => _OrderPageState(); } class _OrderPageState extends ConsumerState<OrdersListPage> with SingleTickerProviderStateMixin { late TabController _tabController; late RefreshController activeRefreshController; late RefreshController historyRefreshController; late RefreshController refundRefreshController; late OrdersListNotifier event; final _tabs = [ Tab(text: AppHelpers.getTranslation(TrKeys.activeOrders)), Tab(text: AppHelpers.getTranslation(TrKeys.orderHistory)), Tab(text: AppHelpers.getTranslation(TrKeys.reFound)), ]; @override void initState()`
*No documentation provided (generation failed).*

### `didChangeDependencies()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: CustomScaffold( body: (colors) => Column( children: [ CommonAppBar( child: Text( AppHelpers.getTranslation(TrKeys.order), style: AppStyle.interNoSemi(size: 18, color: colors.textBlack), ), ), 16.verticalSpace, Expanded( child: Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Column( children: [ CustomTabBar( isScrollable: true, tabController: _tabController, tabs: _tabs, ), Expanded( child: TabBarView( controller: _tabController, children: [ state.isActiveLoading ? const Loading() : SmartRefresher( controller: activeRefreshController, enablePullDown: true, enablePullUp: true, onRefresh: ()`
*No documentation provided (generation failed).*

### `OrdersItem(order: state.activeOrders[index], isActive: true, ); }, ) : _resultEmpty(colors), ), state.isHistoryLoading ? const Loading() : SmartRefresher( controller: historyRefreshController, enablePullDown: true, enablePullUp: true, onRefresh: ()`
*No documentation provided (generation failed).*

### `OrdersItem(order: state.historyOrders[index], isActive: false, ); }, ), ), state.isRefundLoading ? const Loading() : SmartRefresher( controller: refundRefreshController, enablePullDown: true, enablePullUp: true, onRefresh: ()`
*No documentation provided (generation failed).*

### `OrdersItem(isRefund: true, isActive: false, refund: state.refundOrders[index], ); }, ), ), ], ), ), ], ), ), ), ], ), floatingActionButtonLocation: FloatingActionButtonLocation.startFloat, floatingActionButton: (colors) => Padding( padding: EdgeInsets.only(left: 16.w), child: const PopButton(), ), ), ); } } Widget _resultEmpty(CustomColorSet colors)`
*No documentation provided (generation failed).*
