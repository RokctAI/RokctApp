# API Reference: parcel_list_page

Source file: `lib/customer/presentation/pages/parcel/parcel_list_page.dart`

## Classes

### class `ParcelListPage`

## Whitelisted API Endpoints

### `ParcelListPage({super.key}); @override ConsumerState<ParcelListPage> createState() => _ParcelListPageState(); } class _ParcelListPageState extends ConsumerState<ParcelListPage> with SingleTickerProviderStateMixin { late TabController _tabController; late RefreshController activeRefreshController; late RefreshController historyRefreshController; late ParcelListNotifier event; final _tabs = [ Tab(text: AppHelpers.getTranslation(TrKeys.activeParcel)), Tab(text: AppHelpers.getTranslation(TrKeys.parcelHistory)), ]; @override void initState()`
*No documentation provided (generation failed).*

### `didChangeDependencies()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: CustomScaffold( body: (colors) => Column( children: [ CommonAppBar( child: Text( AppHelpers.getTranslation(TrKeys.parcels), style: AppStyle.interNoSemi(size: 18, color: colors.textBlack), ), ), 16.verticalSpace, Expanded( child: Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Column( children: [ CustomTabBar( isScrollable: false, tabController: _tabController, tabs: _tabs, ), Expanded( child: TabBarView( controller: _tabController, children: [ state.isActiveLoading ? const Loading() : SmartRefresher( controller: activeRefreshController, enablePullDown: true, enablePullUp: true, onRefresh: ()`
*No documentation provided (generation failed).*

### `ParcelItem(parcel: state.activeOrders[index], isActive: true, colors: colors, ); }, ) : _resultEmpty(), ), state.isHistoryLoading ? const Loading() : SmartRefresher( controller: historyRefreshController, enablePullDown: true, enablePullUp: true, onRefresh: ()`
*No documentation provided (generation failed).*

### `ParcelItem(parcel: state.historyOrders[index], isActive: false, colors: colors, ); }, ), ), ], ), ), ], ), ), ), ], ), floatingActionButtonLocation: FloatingActionButtonLocation.startFloat, floatingActionButton: (colors) => Padding( padding: EdgeInsets.only(left: 16.w), child: const PopButton(), ), ), ); } } Widget _resultEmpty()`
*No documentation provided (generation failed).*
