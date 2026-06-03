# API Reference: banner_screen

Source file: `lib/customer/presentation/pages/home/home_three/widgets/banner_screen.dart`

## Classes

### class `BannerScreen`

## Whitelisted API Endpoints

### `BannerScreen({ super.key, required this.image, required this.desc, required this.list, required this.bannerId, this.isAds = false, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Container(decoration: BoxDecoration( color: AppStyle.white, borderRadius: BorderRadius.only( topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r), ), ), padding: EdgeInsets.only(bottom: MediaQuery.paddingOf(context).bottom), child: Column( mainAxisSize: MainAxisSize.min, children: [ SizedBox( height: 192.h, width: MediaQuery.sizeOf(context).width, child: ClipRRect( borderRadius: BorderRadius.only( topLeft: Radius.circular(8.r), topRight: Radius.circular(8.r), ), child: CustomNetworkImage( url: image, height: double.infinity, width: double.infinity, radius: 0, ), ), ), Padding( padding: EdgeInsets.all(16.r), child: Text( desc, style: AppStyle.interRegular(size: 14, color: AppStyle.textGrey), ), ), Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Row( children: [ Expanded( child: CustomButton( background: AppStyle.transparent, borderColor: AppStyle.tabBarBorder, title: AppHelpers.getTranslation(TrKeys.cancel), onPressed: ()`
*No documentation provided (generation failed).*
