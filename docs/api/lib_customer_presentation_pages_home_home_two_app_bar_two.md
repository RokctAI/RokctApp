# API Reference: app_bar_two

Source file: `lib/customer/presentation/pages/home/home_two/app_bar_two.dart`

## Classes

### class `AppBarTwo`

## Whitelisted API Endpoints

### `AppBarTwo({ super.key, required this.state, required this.event, required this.colors, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `CommonAppBar(child: Row( crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.start, children: [ Expanded( child: InkWell( onTap: ()`
*No documentation provided (generation failed).*

### `BoxDecoration(shape: BoxShape.circle, color: AppStyle.white, ), padding: EdgeInsets.all(12.r), child: SvgPicture.asset(Assets.svgAddress), ), 10.horizontalSpace, Expanded( child: Column( crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.end, children: [ Text( AppHelpers.getTranslation(TrKeys.deliveryAddress), style: AppStyle.interNormal( size: 12, color: AppStyle.textGrey, ), ), Row( children: [ Flexible( child: Text( (LocalStorage.getAddressSelected() ?.title ?.isEmpty ?? true) ? LocalStorage.getAddressSelected() ?.address ?? '' : LocalStorage.getAddressSelected() ?.title ?? "", style: AppStyle.interSemi( size: 13, color: colors.textBlack, ), maxLines: 1, ), ), Icon( Icons.keyboard_arrow_down_sharp, size: 20.r, color: colors.textBlack, ), ], ), ], ), ), ], ), ), ), 10.horizontalSpace, GestureDetector( onTap: ()`
*No documentation provided (generation failed).*
