# API Reference: parcels_page

Source file: `lib/driver/presentation/pages/parcel/parcels_page.dart`

## Classes

### class `DriverParcelsPage`

## Whitelisted API Endpoints

### `DriverParcelsPage({super.key}); @override ConsumerState<DriverParcelsPage> createState() => _ParcelsPageState(); } class _ParcelsPageState extends ConsumerState<DriverParcelsPage> with SingleTickerProviderStateMixin { late TabController _tabController; late RefreshController activeController; late RefreshController availableController; late ParcelNotifier event; final _tabs = [ Tab(child: Text(AppHelpers.getTranslation(TrKeys.activeParcels))), Tab(child: Text(AppHelpers.getTranslation(TrKeys.availableParcels))), ]; @override void initState()`
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

### `ParcelItem(parcel: state.activeOrders[index], isOrder: true, isSet: false, ); }, ) : _resultEmpty(), ), state.isAvailableLoading ? const Loading() : SmartRefresher( enablePullDown: true, enablePullUp: true, onRefresh: ()`
*No documentation provided (generation failed).*

### `BouncingScrollPhysics(), itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `ParcelItem(parcel: state.availableOrders[index], isOrder: true, isSet: true, ); }, ) : _resultEmpty(), ), ], ), ), ], ), ), ), ], ), floatingActionButtonLocation: FloatingActionButtonLocation.startFloat, floatingActionButton: const PopButton(), ); } } Widget _resultEmpty()`
*No documentation provided (generation failed).*
