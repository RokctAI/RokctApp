# API Reference: market_two_item

Source file: `lib/customer/presentation/pages/home/home_two/widget/market_two_item.dart`

## Classes

### class `MarketTwoItem`

## Whitelisted API Endpoints

### `MarketTwoItem({ super.key, this.isSimpleShop = false, required this.shop, this.isShop = false, this.isFilter = false, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `ThemeWrapper(builder: (colors, theme)`
*No documentation provided (generation failed).*

### `GestureDetector(onTap: ()`
*No documentation provided (generation failed).*

### `BadgeItem(), ), ], ), ), 10.horizontalSpace, SvgPicture.asset(Assets.svgStar, height: 14.r), 4.horizontalSpace, Text( (shop.avgRate ?? ""), style: AppStyle.interNormal( size: 12, color: colors.textBlack, ), ), ], ), 6.verticalSpace, Text( shop.bonus != null ? ((shop.bonus?.type ?? "sum") == "sum") ? "${AppHelpers.getTranslation(TrKeys.under)} ${AppHelpers.numberFormat(shop.bonus?.value)} + ${shop.bonus?.bonusStock?.product?.translation?.title ?? ""}" : "${AppHelpers.getTranslation(TrKeys.under)} ${shop.bonus?.value ?? 0} + ${shop.bonus?.bonusStock?.product?.translation?.title ?? ""}" : shop.translation?.description ?? "", style: AppStyle.interNormal( size: 12, color: colors.textBlack, ), maxLines: isSimpleShop ? 2 : 1, ), 6.verticalSpace, ], ), ), ], ), ), ); }, ); } Widget _shopItem(CustomColorSet colors)`
*No documentation provided (generation failed).*
