# API Reference: market_item

Source file: `lib/customer/presentation/components/market_item.dart`

## Classes

### class `MarketItem`

## Whitelisted API Endpoints

### `MarketItem({ super.key, this.isSimpleShop = false, required this.shop, this.isShop = false, }); bool checkShopClosed()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `ThemeWrapper(builder: (colors, theme)`
*No documentation provided (generation failed).*

### `GestureDetector(onTap: ()`
*No documentation provided (generation failed).*

### `BadgeItem(), ), ], ), ), Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Text( shop.bonus != null ? ((shop.bonus?.type ?? "sum") == "sum") ? "${AppHelpers.getTranslation(TrKeys.under)} ${AppHelpers.numberFormat(shop.bonus?.value)} + ${shop.bonus?.bonusStock?.product?.translation?.title ?? ""}" : "${AppHelpers.getTranslation(TrKeys.under)} ${shop.bonus?.value ?? 0} + ${shop.bonus?.bonusStock?.product?.translation?.title ?? ""}" : shop.translation?.description ?? "", style: AppStyle.interNormal( size: 12, color: colors.textBlack, ), maxLines: 2, ), ), 8.verticalSpace, Divider( color: colors.textBlack.withValues(alpha: 0.3), ), Padding( padding: EdgeInsets.only( top: 8.h, right: 16.w, left: 16.w, bottom: 12.h, ), child: Row( crossAxisAlignment: CrossAxisAlignment.center, children: [ SvgPicture.asset(Assets.svgDelivery), 10.horizontalSpace, Text( "${shop.deliveryTime?.from ?? 0} - ${shop.deliveryTime?.to ?? 0} ${shop.deliveryTime?.type ?? "min"}", style: AppStyle.interNormal( size: 14, color: colors.textBlack, ), ), 10.horizontalSpace, Container( width: 5.w, height: 5.h, decoration: BoxDecoration( shape: BoxShape.circle, color: colors.textBlack, ), ), 10.horizontalSpace, SvgPicture.asset(Assets.svgStar), 10.horizontalSpace, Text( (shop.avgRate ?? ""), style: AppStyle.interNormal( size: 14, color: colors.textBlack, ), ), ], ), ), ], ), ], ), Positioned( top: 86.h, right: 0, left: 0, child: Padding( padding: EdgeInsets.symmetric(horizontal: 18.w), child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.end, children: [ ShopAvatar( shopImage: shop.logoImg ?? "", size: isSimpleShop ? 50 : 44, padding: 4.r, ), Padding( padding: EdgeInsets.only( bottom: isSimpleShop ? 6.h : 0, ), child: BonusDiscountPopular( isPopular: shop.isRecommend ?? false, bonus: shop.bonus, isDiscount: shop.isDiscount, colors: colors, ), ), ], ), ), ), ], ), ), ); }, ); } Widget _shopItem(BuildContext context, CustomColorSet colors)`
*No documentation provided (generation failed).*
