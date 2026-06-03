# API Reference: reservation_shops

Source file: `lib/customer/presentation/pages/profile/reservation_shops.dart`

## Classes

### class `ReservationShops`

## Whitelisted API Endpoints

### `ReservationShops({super.key, required this.colors}); @override ConsumerState<ReservationShops> createState() => _ReservationShopsState(); } class _ReservationShopsState extends ConsumerState<ReservationShops> { final RefreshController _recommendedController = RefreshController(); @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `SizedBox(height: 480.r, width: MediaQuery.sizeOf(context).width / 1.4, child: Column( children: [ Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ Expanded( child: Text( AppHelpers.getTranslation(TrKeys.shop), style: AppStyle.interNoSemi( size: 16, color: widget.colors.textBlack, ), ), ), GestureDetector( onTap: () => Navigator.pop(context), child: Icon(Icons.close, color: widget.colors.textBlack), ), ], ), Expanded( child: SmartRefresher( controller: _recommendedController, enablePullDown: true, enablePullUp: true, onLoading: () async { await event.fetchShopPage(context, _recommendedController); }, onRefresh: () async { await event.fetchShopPage( context, _recommendedController, isRefresh: true, ); }, child: ListView.builder( itemCount: state.shops.length, shrinkWrap: true, padding: REdgeInsets.symmetric(vertical: 8), itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `Padding(padding: REdgeInsets.only(bottom: 8), child: AnimationButtonEffect( child: GestureDetector( onTap: ()`
*No documentation provided (generation failed).*
