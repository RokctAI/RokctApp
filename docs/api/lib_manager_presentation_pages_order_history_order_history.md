# API Reference: order_history

Source file: `lib/manager/presentation/pages/order_history/order_history.dart`

## Classes

### class `ManagerOrderHistoryPage`

## Whitelisted API Endpoints

### `ManagerOrderHistoryPage({super.key}); @override ConsumerState<ManagerOrderHistoryPage> createState() => _OrderHistoryPageState(); } class _OrderHistoryPageState extends ConsumerState<ManagerOrderHistoryPage> with SingleTickerProviderStateMixin { late RefreshController _deliveredRefreshController; late RefreshController _canceledRefreshController; late TabController _tabController; final List<Tab> tabs = <Tab>[ Tab(text: AppHelpers.getTranslation(TrKeys.delivered)), Tab(text: AppHelpers.getTranslation(TrKeys.canceled)), ]; int count = 0; @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Scaffold(backgroundColor: AppStyle.textGrey, body: Column( children: [ CustomAppBar( height: 120, bottomPadding: 16.h, child: Column( crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.end, children: [ Text( AppHelpers.getTranslation(TrKeys.orderHistory), style: AppStyle.interSemi(size: 18), ), Text( '${AppHelpers.getTranslation(TrKeys.thereAre)} ${state.totalCount} ${AppHelpers.getTranslation(TrKeys.orders)}', style: AppStyle.interRegular(size: 12, letterSpacing: -0.3), ), ], ), ), 12.verticalSpace, Padding( padding: REdgeInsets.symmetric(horizontal: 16), child: CustomTabBar(tabs: tabs, tabController: _tabController), ), Expanded( child: TabBarView( controller: _tabController, children: [ DeliveredOrdersBody( refreshController: _deliveredRefreshController, ), CanceledOrdersBody( refreshController: _canceledRefreshController, ), ], ), ), ], ), floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, floatingActionButton: Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Row( crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ const PopButton(heroTag: AppConstants.heroTagOrderHistory), GestureDetector( onTap: () => AppHelpers.showCustomModalBottomSheet( paddingTop: MediaQuery.paddingOf(context).top, context: context, radius: 12, modal: FilterScreen( onChangeDay: (rangeDatePicker)`
*No documentation provided (generation failed).*
