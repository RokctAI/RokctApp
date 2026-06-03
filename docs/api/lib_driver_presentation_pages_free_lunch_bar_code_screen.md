# API Reference: bar_code_screen

Source file: `lib/driver/presentation/pages/free_lunch/bar_code_screen.dart`

## Classes

### class `BarCodeScreen`

## Whitelisted API Endpoints

### `BarCodeScreen({super.key}); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Padding(padding: EdgeInsets.symmetric(horizontal: 16.w), child: Column( children: [ const RestaurantItem( shopName: "Evos", shopImage: "https://dostavkainfo.uz/wp-content/uploads/2020/03/evos.png", shopText: "Combo #1", shopUid: "0", shopId: "0", ), 16.verticalSpace, Container( decoration: BoxDecoration( borderRadius: BorderRadius.circular(10.r), border: Border.all(color: AppStyle.shimmerBase), ), padding: EdgeInsets.all(12.r), child: Row( children: [ const Icon( FlutterRemix.error_warning_fill, color: AppStyle.blue, ), 12.horizontalSpace, RichText( text: TextSpan( text: AppHelpers.getTranslation(TrKeys.youWillShow), style: AppStyle.interRegular( size: 14.sp, letterSpacing: -0.3, ), children: [ TextSpan( text: AppHelpers.getTranslation(TrKeys.qRCode), style: AppStyle.interSemi( size: 14.sp, letterSpacing: -0.3, ), ), TextSpan( text: AppHelpers.getTranslation(TrKeys.toTheRestaurant), style: AppStyle.interRegular( size: 14.sp, letterSpacing: -0.3, ), ), ], ), ), ], ), ), 24.verticalSpace, Image.asset(Assets.imageQr), 24.verticalSpace, Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `CustomButton(title: AppHelpers.getTranslation(TrKeys.showOnMap), icon: const Icon( FlutterRemix.map_pin_range_fill, color: AppStyle.black, ), onPressed: () async { Navigator.pop(context); final Uint8List markerMarketIcon = await AppHelpers.getBytesFromAsset( Assets.imageMarker, 100, ).whenComplete(()`
*No documentation provided (generation failed).*
