# API Reference: app_bar_one

Source file: `lib/customer/presentation/pages/home/home_one/app_bar_one.dart`

## Classes

### class `AppBarOne`

## Whitelisted API Endpoints

### `AppBarOne({ super.key, required this.state, required this.event, required this.colors, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `CommonAppBar(child: Row( crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.start, children: [ Expanded( child: InkWell( onTap: ()`
*No documentation provided (generation failed).*

### `BoxDecoration(shape: BoxShape.circle, color: AppStyle.white, ), padding: EdgeInsets.all(12.r), child: SvgPicture.asset(Assets.svgAddress), ), 10.horizontalSpace, Expanded( child: Column( crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.end, children: [ Text( AppHelpers.getTranslation(TrKeys.deliveryAddress), style: AppStyle.interNormal( size: 12, color: AppStyle.textGrey, ), ), Row( children: [ SizedBox( width: MediaQuery.sizeOf(context).width - 210.w, child: Text( (LocalStorage.getAddressSelected() ?.title ?.isEmpty ?? true) ? LocalStorage.getAddressSelected() ?.address ?? '' : LocalStorage.getAddressSelected() ?.title ?? "", style: AppStyle.interBold( size: 14, color: colors.textBlack, ), maxLines: 1, ), ), Icon( Icons.keyboard_arrow_down_sharp, color: colors.textBlack, ), ], ), ], ), ), ], ), ), ), 10.horizontalSpace, GestureDetector( onTap: ()`
*No documentation provided (generation failed).*
