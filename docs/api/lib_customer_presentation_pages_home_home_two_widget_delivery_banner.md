# API Reference: delivery_banner

Source file: `lib/customer/presentation/pages/home/home_two/widget/delivery_banner.dart`

## Classes

### class `DeliveryBanner`

## Whitelisted API Endpoints

### `DeliveryBanner({super.key, required this.colors}); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Padding(padding: REdgeInsets.symmetric(horizontal: 16, vertical: 12), child: Stack( children: [ Padding( padding: REdgeInsets.only(left: 0, right: 0, bottom: 160), child: Image.asset(Assets.imageDeliveryBanner), ), Positioned( top: 16.r, right: 32.r, child: Row( children: [ CustomNetworkImage( url: AppHelpers.getAppLogo(), height: 28.r, width: 28.r, radius: 0, ), 6.horizontalSpace, Text( AppHelpers.getAppName() ?? "", style: AppStyle.interSemi(color: AppStyle.white), ), ], ), ), Positioned( bottom: 16.r, left: 0, right: 32.r, child: Container( width: double.infinity, height: 256, padding: REdgeInsets.symmetric(horizontal: 20, vertical: 20), decoration: ShapeDecoration( color: colors.primary, shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(24.r), ), shadows: const [ BoxShadow( color: AppStyle.shadow, blurRadius: 30, offset: Offset(0, 10), spreadRadius: 0, ), ], ), child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text( AppHelpers.getTranslation(TrKeys.doorToDoor), style: AppStyle.interRegular( size: 32, color: colors.buttonFontColor, ), ), Text( AppHelpers.getTranslation(TrKeys.yourPersonalDoor), style: AppStyle.interNormal( size: 14, color: colors.buttonFontColor, ), ), Spacer(), AnimationButtonEffect( child: InkWell( borderRadius: BorderRadius.circular(8), onTap: ()`
*No documentation provided (generation failed).*
