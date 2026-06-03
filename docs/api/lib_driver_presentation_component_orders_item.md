# API Reference: orders_item

Source file: `lib/driver/presentation/component/orders_item.dart`

## Classes

### class `OrdersItem`

## Whitelisted API Endpoints

### `OrdersItem({ super.key, required this.order, required this.isOrder, this.isActiveButton = false, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `GestureDetector(onTap: () async { AppHelpers.showCustomModalBottomSheet( paddingTop: MediaQuery.paddingOf(context).top, context: context, radius: 12, modal: OrderDetail( isOrder: isOrder, order: order, isActiveButton: isActiveButton, ), isDarkMode: true, ); }, child: Container( width: double.infinity, margin: EdgeInsets.only(bottom: 10.h), padding: EdgeInsets.symmetric(vertical: 16.h), decoration: BoxDecoration( color: AppStyle.white, borderRadius: BorderRadius.circular(10.r), ), child: Column( children: [ Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Row( crossAxisAlignment: CrossAxisAlignment.start, children: [ Container( height: 32.r, width: 32.r, decoration: const BoxDecoration( color: AppStyle.white, shape: BoxShape.circle, ), child: ClipOval( child: CachedNetworkImage( imageUrl: "${order.shop?.logoImg}", fit: BoxFit.cover, progressIndicatorBuilder: (context, url, progress)`
*No documentation provided (generation failed).*

### `ImageShimmer(isCircle: true, size: 32.r); }, errorWidget: (context, url, error)`
*No documentation provided (generation failed).*

### `Container(height: 32.r, width: 32.r, decoration: const BoxDecoration( shape: BoxShape.circle, color: AppStyle.textGrey, ), alignment: Alignment.center, child: const Icon( FlutterRemix.image_line, color: AppStyle.black, ), ); }, ), ), ), 16.horizontalSpace, Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text( order.shop?.translation?.title ?? "", style: AppStyle.interSemi( size: 14.sp, letterSpacing: -0.3, ), ), 2.verticalSpace, IntrinsicHeight( child: Row( children: [ Text( 'â„– ${order.id}', style: AppStyle.interNormal( size: 14.sp, letterSpacing: -0.3, ), ), const VerticalDivider(), Text( intl.DateFormat("MMM dd HH:mm").format( DateTime.parse( order.createdAt ?? DateTime.now().toString(), ).toLocal(), ), style: AppStyle.interNormal( size: 14.sp, letterSpacing: -0.3, ), ), ], ), ), ], ), const Spacer(), Container( width: 36.r, height: 36.r, decoration: const BoxDecoration( color: AppStyle.textGrey, shape: BoxShape.circle, ), child: const Center( child: Icon(FlutterRemix.bank_card_2_line), ), ), ], ), Padding( padding: EdgeInsets.only(left: 14.w), child: Column( children: [ Container( width: 4.r, height: 4.r, margin: EdgeInsets.only(bottom: 6.h, top: 2.h), decoration: const BoxDecoration( color: AppStyle.tabBarBorder, shape: BoxShape.circle, ), ), Container( width: 4.r, height: 4.r, margin: EdgeInsets.only(bottom: 6.h), decoration: const BoxDecoration( color: AppStyle.tabBarBorder, shape: BoxShape.circle, ), ), ], ), ), Row( crossAxisAlignment: CrossAxisAlignment.start, children: [ Container( height: 32.r, width: 32.r, decoration: const BoxDecoration( color: AppStyle.white, shape: BoxShape.circle, ), child: ClipOval( child: CachedNetworkImage( imageUrl: order.user?.img ?? "", fit: BoxFit.cover, progressIndicatorBuilder: (context, url, progress)`
*No documentation provided (generation failed).*

### `ImageShimmer(isCircle: true, size: 32.r); }, errorWidget: (context, url, error)`
*No documentation provided (generation failed).*
