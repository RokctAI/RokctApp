# API Reference: product_filter

Source file: `lib/customer/presentation/pages/shop/product_filter.dart`

## Classes

### class `ProductFilter`

## Whitelisted API Endpoints

### `ProductFilter({ super.key, required this.shopId, required this.categoryId, required this.sort, }); @override Widget build(BuildContext context, ref)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: LocalStorage.getLangLtr() ? TextDirection.ltr : TextDirection.rtl, child: Container( decoration: BoxDecoration( color: AppStyle.bgGrey, borderRadius: BorderRadius.only( topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r), ), ), width: double.infinity, child: Padding( padding: const EdgeInsets.all(16.0), child: ListView( shrinkWrap: true, children: [ 8.verticalSpace, Center( child: Container( height: 4.h, width: 48.w, decoration: BoxDecoration( color: AppStyle.dragElement, borderRadius: BorderRadius.all(Radius.circular(40.r)), ), ), ), 18.verticalSpace, TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.filter), rightTitleColor: AppStyle.red, rightTitle: AppHelpers.getTranslation(TrKeys.clearAll), onRightTap: ()`
*No documentation provided (generation failed).*

### `GestureDetector(onTap: ()`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 400), margin: EdgeInsets.only(right: 8.w, bottom: 8.h), padding: EdgeInsets.symmetric( vertical: 10.h, horizontal: 16.w, ), decoration: BoxDecoration( borderRadius: BorderRadius.circular(10.r), color: state.sortIndex == sort.indexOf(e) ? AppStyle.primary : AppStyle.white, ), child: Row( mainAxisSize: MainAxisSize.min, children: [ Row( children: [ Container( width: 14.w, height: 14.h, decoration: BoxDecoration( border: Border.all( width: state.sortIndex == sort.indexOf(e) ? 4.r : 2.r, color: AppStyle.black, ), color: AppStyle.transparent, shape: BoxShape.circle, ), ), 6.horizontalSpace, ], ), Text( AppHelpers.getTranslation(e), style: AppStyle.interNormal( size: 14, color: AppStyle.black, ), ), ], ), ), ), ) .toList(), ), 24.verticalSpace, Text( AppHelpers.getTranslation(TrKeys.brands), style: AppStyle.interNoSemi(size: 16, color: AppStyle.black), ), 18.verticalSpace, Wrap( children: state.brands ?.map( (e) => GestureDetector( onTap: ()`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 400), margin: EdgeInsets.only(right: 8.w, bottom: 8.h), padding: EdgeInsets.symmetric( vertical: 10.h, horizontal: 16.w, ), decoration: BoxDecoration( borderRadius: BorderRadius.all( Radius.circular(10.r), ), color: state.brandIds.contains(e.id) ? AppStyle.primary : AppStyle.white, ), child: Text( e.title ?? "", style: AppStyle.interNormal( size: 14, color: AppStyle.black, ), ), ), ), ) .toList() ?? [], ), 24.verticalSpace, CustomButton( title: AppHelpers.getTranslation(TrKeys.show), onPressed: ()`
*No documentation provided (generation failed).*
