# API Reference: shop_product_item

Source file: `lib/customer/presentation/pages/shop/widgets/shop_product_item.dart`

## Classes

### class `ShopProductItem`

## Whitelisted API Endpoints

### `ShopProductItem({super.key, required this.product}); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `ThemeWrapper(builder: (colors, theme)`
*No documentation provided (generation failed).*

### `Container(margin: EdgeInsets.all(4.r), decoration: BoxDecoration( color: colors.icon, borderRadius: BorderRadius.circular(10.r), ), child: Padding( padding: EdgeInsets.all(14.r), child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [ CustomNetworkImage( url: product.img ?? "", height: 100.h, width: double.infinity, radius: 0, ), 8.verticalSpace, Text( product.translation?.title ?? "", style: AppStyle.interNoSemi( size: 14, color: colors.textBlack, ), maxLines: 2, ), Text( product.translation?.description ?? "", style: AppStyle.interRegular( size: 12, color: colors.textBlack, ), maxLines: 1, overflow: TextOverflow.ellipsis, ), Row( crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text( AppHelpers.numberFormat( (product.discounts?.isNotEmpty ?? false ? ((product.stock?.price ?? 0) + (product.stock?.tax ?? 0)) : null) ?? (product.stock?.totalPrice ?? 0), ), style: AppStyle.interNoSemi( size: 16, color: colors.textBlack, decoration: isDiscount ? TextDecoration.none : TextDecoration.lineThrough, ), ), isDiscount ? const SizedBox.shrink() : Container( margin: EdgeInsets.only(top: 8.r), decoration: BoxDecoration( color: AppStyle.redBg, borderRadius: BorderRadius.circular(30.r), ), padding: EdgeInsets.all(4.r), child: Row( children: [ SvgPicture.asset(Assets.svgDiscount), 8.horizontalSpace, Text( AppHelpers.numberFormat( product.stock?.totalPrice, ), style: AppStyle.interNoSemi( size: 12, color: AppStyle.red, ), ), ], ), ), ], ), product.stock?.bonus != null ? AnimationButtonEffect( child: InkWell( onTap: ()`
*No documentation provided (generation failed).*
