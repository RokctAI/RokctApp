# API Reference: push_order_screen

Source file: `lib/driver/presentation/pages/push_order/push_order_screen.dart`

## Classes

### class `PushOrder`

## Whitelisted API Endpoints

### `PushOrder({super.key, required this.pushModel, required this.isActive}); @override ConsumerState<PushOrder> createState() => _PushOrderState(); } class _PushOrderState extends ConsumerState<PushOrder> { @override void initState()`
*No documentation provided (generation failed).*

### `deactivate()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Container(height: widget.isActive ? 500.h : 400.h, width: double.infinity, color: AppStyle.transparent, child: Stack( children: [ Positioned( bottom: 64.h, child: Container( height: widget.isActive ? 400.h : 300.h, width: MediaQuery.sizeOf(context).width - 32.w, decoration: BoxDecoration( color: AppStyle.white, borderRadius: BorderRadius.circular(10.r), ), child: Padding( padding: EdgeInsets.only( top: widget.isActive ? 84.h : 32.h, left: 16.w, right: 16.w, ), child: Column( children: [ _orderAvatar(), const Spacer(), const Divider(color: AppStyle.border), 16.verticalSpace, Row( children: [ Icon(FlutterRemix.currency_line, size: 21.r), 10.horizontalSpace, Text( AppHelpers.numberFormat( number: widget.pushModel.totalPrice ?? 0, ), style: AppStyle.interSemi(size: 12.sp), ), const Spacer(), Icon(FlutterRemix.takeaway_fill, size: 18.sp), 10.horizontalSpace, Text( AppHelpers.numberFormat( number: widget.pushModel.deliveryFee ?? 0, ), style: AppStyle.interSemi(size: 12.sp), ), const Spacer(), Icon(FlutterRemix.bank_card_2_line, size: 18.sp), 10.horizontalSpace, Text( widget.pushModel.transaction?.paymentSystem?.tag ?? "", style: AppStyle.interSemi(size: 12.sp), ), ], ), 16.verticalSpace, const Divider(color: AppStyle.border), const Spacer(), Row( children: [ Expanded( child: CustomButton( title: AppHelpers.getTranslation(TrKeys.skip), onPressed: ()`
*No documentation provided (generation failed).*

### `MarkerId("Shop", ), position: LatLng( double.parse( widget .pushModel .shop ?.location ?.latitude ?? "0", ), double.parse( widget .pushModel .shop ?.location ?.longitude ?? "0", ), ), icon: await image .resizeAndCircle( widget .pushModel .shop ?.logoImg ?? "", 120, ), ), ); }, ); } else { Navigator.pop(context); } }, ), ), ], ), 24.verticalSpace, ], ), ), ), ), widget.isActive ? _timer(context) : const SizedBox.shrink(), ], ), ); } Widget _timer(BuildContext context)`
*No documentation provided (generation failed).*

### `Positioned(top: 0, right: (MediaQuery.sizeOf(context).width - 32.w) / 2 - 52.r, child: Container( padding: EdgeInsets.all(4.r), decoration: const BoxDecoration( color: AppStyle.white, shape: BoxShape.circle, ), child: CircularPercentIndicator( radius: 48.r, lineWidth: 12.r, percent: double.parse( ref .watch(pushOrderProvider) .timerText .substring( 0, ref.watch(pushOrderProvider).timerText.indexOf(' '), ), ) / AppHelpers.getAppDeliveryTime(), center: Text( ref.watch(pushOrderProvider).timerText, style: AppStyle.interSemi(size: 18.sp), ), fillColor: AppStyle.transparent, backgroundColor: AppStyle.shimmerBase, progressColor: AppStyle.progress, circularStrokeCap: CircularStrokeCap.round, ), ), ); } Widget _orderAvatar()`
*No documentation provided (generation failed).*

### `Column(crossAxisAlignment: CrossAxisAlignment.start, children: [ Row( crossAxisAlignment: CrossAxisAlignment.start, children: [ Container( height: 32.r, width: 32.r, decoration: const BoxDecoration( color: AppStyle.white, shape: BoxShape.circle, ), child: ClipOval( child: CachedNetworkImage( imageUrl: "${widget.pushModel.shop?.logoImg}", fit: BoxFit.cover, progressIndicatorBuilder: (context, url, progress)`
*No documentation provided (generation failed).*

### `ImageShimmer(isCircle: true, size: 32.r); }, errorWidget: (context, url, error)`
*No documentation provided (generation failed).*

### `Container(height: 32.r, width: 32.r, decoration: const BoxDecoration( shape: BoxShape.circle, color: AppStyle.textGrey, ), alignment: Alignment.center, child: const Icon( FlutterRemix.image_line, color: AppStyle.black, ), ); }, ), ), ), 16.horizontalSpace, Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text( widget.pushModel.shop?.translation?.title ?? "", style: AppStyle.interSemi(size: 14.sp, letterSpacing: -0.3), ), 2.verticalSpace, IntrinsicHeight( child: Row( children: [ Text( 'â„– ${widget.pushModel.id}', style: AppStyle.interNormal( size: 14.sp, letterSpacing: -0.3, ), ), const VerticalDivider(), Text( intl.DateFormat("hh:mm").format( DateTime.tryParse( widget.pushModel.updatedAt ?? DateTime.now().toString(), )?.toLocal() ?? DateTime.now(), ), style: AppStyle.interNormal( size: 14.sp, letterSpacing: -0.3, ), ), 16.horizontalSpace, Icon(FlutterRemix.building_fill, size: 18.r), ], ), ), ], ), ], ), Padding( padding: EdgeInsets.only(left: 14.w), child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Container( width: 4.r, height: 4.r, margin: EdgeInsets.only(bottom: 6.h, top: 6.h), decoration: const BoxDecoration( color: AppStyle.tabBarBorder, shape: BoxShape.circle, ), ), Container( width: 4.r, height: 4.r, margin: EdgeInsets.only(bottom: 10.h), decoration: const BoxDecoration( color: AppStyle.tabBarBorder, shape: BoxShape.circle, ), ), ], ), ), Row( crossAxisAlignment: CrossAxisAlignment.start, children: [ Container( height: 32.r, width: 32.r, decoration: const BoxDecoration( color: AppStyle.white, shape: BoxShape.circle, ), child: ClipOval( child: CachedNetworkImage( imageUrl: widget.pushModel.user?.img ?? "", fit: BoxFit.cover, progressIndicatorBuilder: (context, url, progress)`
*No documentation provided (generation failed).*

### `ImageShimmer(isCircle: true, size: 32.r); }, errorWidget: (context, url, error)`
*No documentation provided (generation failed).*
