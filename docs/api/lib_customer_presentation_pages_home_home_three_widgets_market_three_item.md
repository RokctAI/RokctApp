# API Reference: market_three_item

Source file: `lib/customer/presentation/pages/home/home_three/widgets/market_three_item.dart`

## Classes

### class `MarketThreeItem`

## Whitelisted API Endpoints

### `MarketThreeItem({ super.key, this.isSimpleShop = false, required this.shop, this.isShop = false, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `ThemeWrapper(builder: (colors, theme)`
*No documentation provided (generation failed).*

### `GestureDetector(onTap: ()`
*No documentation provided (generation failed).*

### `BadgeItem(), ), ], ), Container( padding: REdgeInsets.all(8), decoration: ShapeDecoration( color: colors.icon, shape: CircleBorder(), ), child: Text( (shop.avgRate ?? ""), style: AppStyle.interNormal( size: 12, color: colors.textBlack, ), ), ), ], ), 4.verticalSpace, Row( children: [ Expanded( child: Text( shop.bonus != null ? ((shop.bonus?.type ?? "sum") == "sum") ? "${AppHelpers.getTranslation(TrKeys.under)} ${AppHelpers.numberFormat(shop.bonus?.value)} + ${shop.bonus?.bonusStock?.product?.translation?.title ?? ""}" : "${AppHelpers.getTranslation(TrKeys.under)} ${shop.bonus?.value ?? 0} + ${shop.bonus?.bonusStock?.product?.translation?.title ?? ""}" : shop.translation?.description ?? "", style: AppStyle.interNormal( size: 12, color: colors.textBlack, ), maxLines: 2, ), ), 6.horizontalSpace, Container( width: 5.w, height: 5.h, decoration: const BoxDecoration( shape: BoxShape.circle, color: AppStyle.separatorDot, ), ), 8.horizontalSpace, Text( "${shop.deliveryTime?.from ?? 0}-${shop.deliveryTime?.to ?? 0} ${shop.deliveryTime?.type ?? "min"}", style: AppStyle.interNormal( size: 12, color: colors.textBlack, ), ), ], ), 16.verticalSpace, ], ), ), ], ), Positioned( top: 150.r, right: 0, left: 0, child: Padding( padding: EdgeInsets.symmetric(horizontal: 18.w), child: Padding( padding: EdgeInsets.only( bottom: isSimpleShop ? 6.h : 0, ), child: BonusDiscountPopular( isPopular: shop.isRecommend ?? false, bonus: shop.bonus, isDiscount: shop.isDiscount ?? false, colors: colors, ), ), ), ), ], ), ), ); }, ); } Widget _shopItem(CustomColorSet colors)`
*No documentation provided (generation failed).*
