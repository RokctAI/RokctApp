# API Reference: product_page

Source file: `lib/customer/presentation/pages/product/product_page.dart`

## Classes

### class `ProductScreen`

## Whitelisted API Endpoints

### `ProductScreen({ this.productId, this.data, this.cartId, required this.controller, super.key, }); @override ConsumerState<ConsumerStatefulWidget> createState() => _ProductScreenState(); } class _ProductScreenState extends ConsumerState<ProductScreen> { late bool isLtr; late ProductNotifier event; late ShopOrderNotifier eventOrderShop; late PageController controller; @override void initState()`
*No documentation provided (generation failed).*

### `didChangeDependencies()`
*No documentation provided (generation failed).*

### `deactivate()`
*No documentation provided (generation failed).*

### `CustomButton(isLoading: ref.watch(shopOrderProvider).isDeleteLoading, title: AppHelpers.getTranslation(TrKeys.continueText), onPressed: ()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `ThemeWrapper(builder: (colors, theme)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: Container( decoration: BoxDecoration( color: colors.backgroundColor.withValues(alpha: 0.96), borderRadius: BorderRadius.only( topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r), ), ), width: double.infinity, child: SingleChildScrollView( controller: widget.controller, child: Column( children: [ Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Column( mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [ 8.verticalSpace, Center( child: Container( height: 4.h, width: 48.w, decoration: BoxDecoration( color: AppStyle.dragElement, borderRadius: BorderRadius.all( Radius.circular(40.r), ), ), ), ), 14.verticalSpace, Row( children: [ Expanded( child: TitleAndIcon( title: state.productData?.translation?.title ?? "", paddingHorizontalSize: 0, ), ), GestureDetector( onTap: () => event.shareProduct(), child: Container( width: 40.w, height: 40.w, decoration: BoxDecoration( color: AppStyle.transparent, border: Border.all(color: colors.textBlack), borderRadius: BorderRadius.circular(8.r), ), child: Center( child: Icon( FlutterRemix.share_line, color: colors.textBlack, ), ), ), ), ], ), 20.verticalSpace, Stack( children: [ SizedBox( height: 200.r, child: (state.productData?.galleries?.isNotEmpty ?? false) ? PageView.builder( itemCount: state .productData ?.galleries ?.length ?? 0, controller: controller, onPageChanged: (index)`
*No documentation provided (generation failed).*

### `CustomNetworkImage(url: state.selectImage?.path ?? state.activeImageUrl, height: 200, fit: BoxFit.cover, width: double.infinity, radius: 10, ); }, ) : CustomNetworkImage( url: state.selectImage?.path ?? state.activeImageUrl, height: 200, fit: BoxFit.cover, width: double.infinity, radius: 10, ), ), if ((state.productData?.galleries?.length ?? 0) > 1) Positioned( bottom: 8.r, child: ImagesOneList( list: state.productData?.galleries, selectImageId: state.selectImage?.id, ), ), ], ), state.selectedStock?.bonus != null ? Padding( padding: EdgeInsets.only(top: 12.h), child: Row( children: [ AnimationButtonEffect( child: InkWell( onTap: ()`
*No documentation provided (generation failed).*

### `BoxDecoration(shape: BoxShape.circle, color: AppStyle.blueBonus, ), child: Icon( FlutterRemix.gift_2_fill, size: 16.r, color: AppStyle.white, ), ), ), ), 4.horizontalSpace, Text( ((state.selectedStock?.bonus?.type ?? "sum") == "sum") ? "${AppHelpers.getTranslation(TrKeys.under)} ${AppHelpers.numberFormat(state.selectedStock?.bonus?.value ?? 0)} + ${state.selectedStock?.bonus?.bonusStock?.product?.translation?.title ?? ""}" : "${AppHelpers.getTranslation(TrKeys.under)} ${state.selectedStock?.bonus?.value ?? 0} + ${state.selectedStock?.bonus?.bonusStock?.product?.translation?.title ?? ""}", style: AppStyle.interRegular( size: 14, color: AppStyle.black, ), ), ], ), ) : const SizedBox.shrink(), 15.verticalSpace, SizedBox( width: MediaQuery.sizeOf(context).width, child: Row( crossAxisAlignment: CrossAxisAlignment.start, children: [ Expanded( child: Text( state.productData?.translation?.description ?? "", style: AppStyle.interRegular( size: 14, color: AppStyle.textGrey, ), ), ), Column( children: [ Text( AppHelpers.numberFormat( (state.selectedStock?.price ?? 0) + (state.selectedStock?.tax ?? 0), ), style: AppStyle.interRegular( size: 14, color: colors.textBlack, textDecoration: state.selectedStock?.discount == null ? TextDecoration.none : TextDecoration.lineThrough, ), ), state.selectedStock?.discount == null ? const SizedBox.shrink() : Container( margin: EdgeInsets.only(top: 8.r), decoration: BoxDecoration( color: AppStyle.redBg, borderRadius: BorderRadius.circular( 30.r, ), ), padding: EdgeInsets.all(4.r), child: Row( children: [ SvgPicture.asset( Assets.svgDiscount, ), 8.horizontalSpace, Text( AppHelpers.numberFormat( state .selectedStock ?.totalPrice, ), style: AppStyle.interNoSemi( size: 12, color: AppStyle.red, ), ), ], ), ), ], ), ], ), ), 24.verticalSpace, const WProductExtras(), 24.verticalSpace, WIngredientScreen( list: state.selectedStock?.addons ?? [], onChange: (int value)`
*No documentation provided (generation failed).*
