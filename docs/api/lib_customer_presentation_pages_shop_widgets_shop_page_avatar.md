# API Reference: shop_page_avatar

Source file: `lib/customer/presentation/pages/shop/widgets/shop_page_avatar.dart`

## Classes

### class `ShopPageAvatar`

## Whitelisted API Endpoints

### `ShopPageAvatar({ super.key, required this.shop, required this.onLike, required this.workTime, required this.isLike, required this.onShare, required this.bonus, this.cartId, this.userUuid, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `ThemeWrapper(builder: (colors, theme) => Column( children: [ shopAppBar(context, colors), 8.verticalSpace, Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Column( crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [ Row( children: [ Text( (shop.translation?.title?.length ?? 0) > 28 ? "${shop.translation?.title?.substring(0, 28) ?? " "}.." : shop.translation?.title ?? "", style: AppStyle.interSemi( size: 21, color: colors.textBlack, ), ), if (shop.verify ?? false) Padding( padding: EdgeInsets.only(left: 4.r), child: const BadgeItem(), ), ], ), Text( shop.translation?.description ?? "", style: AppStyle.interNormal( size: 13, color: colors.textBlack, ), maxLines: 2, overflow: TextOverflow.ellipsis, ), 6.verticalSpace, GestureDetector( onTap: ()`
*No documentation provided (generation failed).*

### `CustomButton(isLoading: ref.watch(shopOrderProvider).isDeleteLoading, title: AppHelpers.getTranslation(TrKeys.continueText), onPressed: ()`
*No documentation provided (generation failed).*

### `Consumer(builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `CustomButton(isLoading: ref.watch(shopOrderProvider).isStartGroupLoading || ref.watch(shopOrderProvider).isCheckShopOrder, icon: Icon( isStartOrder ? FlutterRemix.list_settings_line : FlutterRemix.group_2_line, color: isStartOrder ? AppStyle.black : AppStyle.white, ), title: isStartOrder ? AppHelpers.getTranslation(TrKeys.manageOrder) : AppHelpers.getTranslation(TrKeys.startGroupOrder), background: isStartOrder ? colors.primary : AppStyle.orderButton, textColor: isStartOrder ? AppStyle.black : AppStyle.white, radius: 10, onPressed: ()`
*No documentation provided (generation failed).*

### `LoginRoute()); } }, ); }, ); } Stack shopAppBar(BuildContext context, CustomColorSet colors)`
*No documentation provided (generation failed).*

### `Stack(children: [ Container( height: 180.h + MediaQuery.paddingOf(context).top, width: double.infinity, color: colors.backgroundColor, child: CustomNetworkImage( url: shop.backgroundImg ?? "", height: 180.h + MediaQuery.paddingOf(context).top, width: double.infinity, radius: 0, ), ), Padding( padding: EdgeInsets.only( top: 130.h + MediaQuery.paddingOf(context).top, left: 16.w, right: 16.w, ), child: ShopAvatar( radius: 20, shopImage: shop.logoImg ?? "", size: 70, padding: 6, bgColor: AppStyle.white.withValues(alpha: 0.65), ), ), Positioned( top: MediaQuery.paddingOf(context).top, right: 16.w, child: Row( children: [ GestureDetector( onTap: ()`
*No documentation provided (generation failed).*

### `LoginRoute()); return; } context.pushRoute( ChatRoute( roleId: shop.id.toString(), name: shop.translation?.title ?? "", ), ); }, child: ClipRRect( borderRadius: BorderRadius.circular(10.r), child: BackdropFilter( filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), child: Container( width: 40.w, height: 40.w, color: AppStyle.unselectedBottomBarItem.withValues( alpha: 0.29, ), child: const Center( child: Icon( FlutterRemix.chat_1_line, color: AppStyle.white, ), ), ), ), ), ), 8.horizontalSpace, GestureDetector( onTap: onLike, child: ClipRRect( borderRadius: BorderRadius.circular(10.r), child: BackdropFilter( filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), child: Container( width: 40.w, height: 40.w, color: AppStyle.unselectedBottomBarItem.withValues( alpha: 0.29, ), child: Center( child: Icon( isLike ? FlutterRemix.heart_3_fill : FlutterRemix.heart_3_line, color: AppStyle.white, ), ), ), ), ), ), 8.horizontalSpace, GestureDetector( onTap: onShare, child: ClipRRect( borderRadius: BorderRadius.circular(10.r), child: BackdropFilter( filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), child: Container( width: 40.w, height: 40.w, color: AppStyle.unselectedBottomBarItem.withValues( alpha: 0.29, ), child: const Center( child: Icon( FlutterRemix.share_line, color: AppStyle.white, ), ), ), ), ), ), ], ), ), ], ); } AnimationButtonEffect _bonusButton(BuildContext context)`
*No documentation provided (generation failed).*

### `AnimationButtonEffect(child: GestureDetector( onTap: ()`
*No documentation provided (generation failed).*
