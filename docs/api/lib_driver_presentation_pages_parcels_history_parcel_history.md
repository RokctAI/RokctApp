# API Reference: parcel_history

Source file: `lib/driver/presentation/pages/parcels_history/parcel_history.dart`

## Classes

### class `DriverParcelHistoryPage`

## Whitelisted API Endpoints

### `DriverParcelHistoryPage({super.key}); @override ConsumerState<DriverParcelHistoryPage> createState() => _ParcelHistoryPageState(); } class _ParcelHistoryPageState extends ConsumerState<DriverParcelHistoryPage> { late RefreshController historyController; @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Scaffold(backgroundColor: AppStyle.textGrey, body: Column( children: [ CustomAppBar( bottomPadding: 16.h, child: Column( crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.end, children: [ Text( AppHelpers.getTranslation(TrKeys.orderHistory), style: AppStyle.interSemi(size: 18.sp), ), Text( AppHelpers.getTranslation(TrKeys.thereAreOrders), style: AppStyle.interRegular( size: 12.sp, letterSpacing: -0.3, ), ), ], ), ), state.isHistoryLoading ? const Padding( padding: EdgeInsets.only(top: 32), child: Loading(), ) : Expanded( child: SmartRefresher( enablePullDown: true, enablePullUp: true, onRefresh: ()`
*No documentation provided (generation failed).*

### `BouncingScrollPhysics(), itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `ParcelItem(isOrder: false, parcel: state.historyOrders[index], isSet: false, ); }, ), ), ), ], ), floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat, floatingActionButton: Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Row( crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ const PopButton(), GestureDetector( onTap: ()`
*No documentation provided (generation failed).*
