# API Reference: shop_detail

Source file: `lib/customer/presentation/pages/shop/shop_detail.dart`

## Classes

### class `ShopDetailPage`

## Whitelisted API Endpoints

### `ShopDetailPage({super.key, required this.shop, required this.workTime}); @override ConsumerState<ShopDetailPage> createState() => _ShopDetailPageState(); } class _ShopDetailPageState extends ConsumerState<ShopDetailPage> { @override initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: Scaffold( backgroundColor: AppStyle.bgGrey, body: SingleChildScrollView( padding: EdgeInsets.symmetric(vertical: 32.r), child: Column( children: [ OrderMap( markers: ref.watch(shopProvider).shopMarkers, latLng: LatLng( widget.shop.location?.latitude ?? AppConstants.demoLatitude, widget.shop.location?.longitude ?? AppConstants.demoLongitude, ), polylineCoordinates: ref .watch(shopProvider) .polylineCoordinates, isLoading: ref.watch(shopProvider).isMapLoading, ), 16.verticalSpace, Padding( padding: EdgeInsetsDirectional.only(start: 16.w), child: Text( "${widget.shop.translation?.title ?? ""}(${widget.shop.translation?.address ?? ""})", style: AppStyle.interBold(), ), ), 16.verticalSpace, Padding( padding: EdgeInsetsDirectional.only(start: 16.w), child: SizedBox( height: 18.h, child: Row( crossAxisAlignment: CrossAxisAlignment.end, children: [ ListView.builder( shrinkWrap: true, scrollDirection: Axis.horizontal, physics: const NeverScrollableScrollPhysics(), itemCount: widget.shop.tags?.length ?? 0, itemBuilder: (BuildContext context, int index)`
*No documentation provided (generation failed).*

### `Text("${widget.shop.tags?[index].translation?.title ?? ""} â€¢ ", style: AppStyle.interNormal( color: AppStyle.textGrey, ), ); }, ), Text( LocalStorage.getSelectedCurrency()?.symbol ?? "", style: AppStyle.interRegular( color: AppStyle.textGrey, size: 14, ), ), ], ), ), ), Padding( padding: EdgeInsets.symmetric(vertical: 16.h), child: Divider(color: AppStyle.hint, thickness: 1.5.w), ), Padding( padding: EdgeInsets.symmetric(horizontal: 24.r), child: InkWell( onTap: () async { await Clipboard.setData( ClipboardData( text: widget.shop.translation?.address ?? "", ), ); }, child: Row( children: [ const Icon(Icons.place_rounded), 24.horizontalSpace, Expanded( child: Text(widget.shop.translation?.address ?? ""), ), const Spacer(), const Icon( FlutterRemix.file_copy_fill, color: AppStyle.textGrey, ), ], ), ), ), Padding( padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h), child: const Divider(color: AppStyle.hint), ), Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Padding(padding: EdgeInsets.symmetric(horizontal: 24.r), child: Column( children: [ Row( children: [ const Icon(FlutterRemix.time_fill), 24.horizontalSpace, Text( "${AppHelpers.getTranslation(TrKeys.openUntil)} ${widget.workTime}", ), const Spacer(), IconButton( icon: Icon( ref.watch(shopProvider).showWeekTime ? FlutterRemix.subtract_fill : FlutterRemix.add_fill, color: AppStyle.textGrey, ), onPressed: ()`
*No documentation provided (generation failed).*

### `NeverScrollableScrollPhysics(), shrinkWrap: true, padding: EdgeInsets.only(left: 48.r), itemCount: widget.shop.shopWorkingDays?.length ?? 0, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `Padding(padding: EdgeInsets.symmetric( vertical: 6.r, ), child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text( AppHelpers.getTranslation( widget .shop .shopWorkingDays?[index] .day ?? "", ).toUpperCase(), style: AppStyle.interNoSemi(size: 14), ), 2.verticalSpace, Text( "${widget.shop.shopWorkingDays?[index].from} - ${widget.shop.shopWorkingDays?[index].to}", ), ], ), ); }, ) : const SizedBox.shrink(), ], ), ); }, ), Padding( padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h), child: const Divider(color: AppStyle.hint), ), if (ref.watch(shopProvider).branches?.isNotEmpty ?? false) _branches(), Padding( padding: EdgeInsets.symmetric(vertical: 16.h), child: Divider(color: AppStyle.hint, thickness: 1.5.w), ), Padding( padding: EdgeInsets.symmetric(horizontal: 24.r), child: Row( children: [ const Icon(FlutterRemix.star_fill), 24.horizontalSpace, Text( "${widget.shop.avgRate} (${widget.shop.rateCount}+ ${AppHelpers.getTranslation(TrKeys.ratings)})", ), ], ), ), ], ), ), floatingActionButtonLocation: FloatingActionButtonLocation.startFloat, floatingActionButton: Padding( padding: EdgeInsets.only(left: 16.w), child: const PopButton(), ), ), ); } Consumer _branches()`
*No documentation provided (generation failed).*

### `Consumer(builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Padding(padding: EdgeInsets.symmetric(horizontal: 24.r), child: Column( children: [ Row( children: [ const Icon(FlutterRemix.store_3_fill), 24.horizontalSpace, Text(AppHelpers.getTranslation(TrKeys.branches)), const Spacer(), IconButton( icon: Icon( ref.watch(shopProvider).showBranch ? FlutterRemix.subtract_fill : FlutterRemix.add_fill, color: AppStyle.textGrey, ), onPressed: ()`
*No documentation provided (generation failed).*

### `NeverScrollableScrollPhysics(), shrinkWrap: true, padding: EdgeInsets.only(left: 48.r), itemCount: ref.watch(shopProvider).branches?.length ?? 0, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `Padding(padding: EdgeInsets.symmetric(vertical: 6.r), child: Row( children: [ SizedBox( width: MediaQuery.sizeOf(context).width - 150.r, child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text( "${branches?.translation?.title ?? ""} : ", style: AppStyle.interNoSemi(size: 14), ), 2.verticalSpace, Text(branches?.address?.address ?? ""), ], ), ), IconButton( onPressed: ()`
*No documentation provided (generation failed).*
