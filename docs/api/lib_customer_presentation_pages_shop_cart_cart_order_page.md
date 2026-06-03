# API Reference: cart_order_page

Source file: `lib/customer/presentation/pages/shop/cart/cart_order_page.dart`

## Classes

### class `CartOrderPage`

## Whitelisted API Endpoints

### `CartOrderPage({ super.key, this.isGroupOrder = false, this.cartId, required this.controller, this.shopId, required this.colors, }); @override ConsumerState<ConsumerStatefulWidget> createState() => _ShopOrderState(); } class _ShopOrderState extends ConsumerState<CartOrderPage> { Timer? timer; @override void initState()`
*No documentation provided (generation failed).*

### `Duration(seconds: 5), (Timer t)`
*No documentation provided (generation failed).*

### `deactivate()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: ClipRRect( borderRadius: BorderRadius.only( topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r), ), child: BackdropFilter( filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), child: Container( decoration: BoxDecoration( boxShadow: [ BoxShadow( color: AppStyle.white.withValues(alpha: 0.25), spreadRadius: 0, blurRadius: 40, offset: const Offset(0, -2), ), ], color: widget.colors.backgroundColor.withValues(alpha: 0.9), borderRadius: BorderRadius.only( topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r), ), ), width: double.infinity, child: state.cart == null || (state.cart?.userCarts?.isEmpty ?? true) || ((state.cart?.userCarts?.isEmpty ?? true) ? true : (state .cart ?.userCarts ?.first .cartDetails ?.isEmpty ?? true)) && !(state.cart?.group ?? false) ? _resultEmpty() : Stack( children: [ ListView( controller: widget.controller, shrinkWrap: true, children: [ 8.verticalSpace, Center( child: Container( height: 4.h, width: 48.w, decoration: BoxDecoration( color: AppStyle.dragElement, borderRadius: BorderRadius.all( Radius.circular(40.r), ), ), ), ), 18.verticalSpace, state.cart?.group ?? false ? _groupOrderList(state, event) : Column( children: [ TitleAndIcon( title: AppHelpers.getTranslation( TrKeys.yourOrder, ), rightTitleColor: AppStyle.red, rightTitle: AppHelpers.getTranslation( TrKeys.clearAll, ), onRightTap: ()`
*No documentation provided (generation failed).*

### `NeverScrollableScrollPhysics(), shrinkWrap: true, itemCount: state .cart ?.userCarts ?.first .cartDetails ?.length ?? 0, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `CartOrderItem(add: () => event.addCount(context, index), remove: () => event.removeCount(context, index), cart: state .cart ?.userCarts ?.first .cartDetails?[index], ); }, ), ], ), bottomWidget(state, context, event, widget.colors), ], ), if (state.isAddAndRemoveLoading) _customLoading(), ], ), ), ), ), ); } ListView _groupOrderList(ShopOrderState state, ShopOrderNotifier event)`
*No documentation provided (generation failed).*

### `NeverScrollableScrollPhysics(), itemCount: state.cart?.userCarts?.length, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `Column(children: [ const Divider(), Theme( data: Theme.of( context, ).copyWith(dividerColor: AppStyle.transparent), child: ExpansionTile( title: TitleAndIcon( title: state.cart?.userCarts?[index].name ?? "", ), children: [ ListView.builder( padding: EdgeInsets.symmetric(horizontal: 16.w), physics: const NeverScrollableScrollPhysics(), shrinkWrap: true, itemCount: state.cart?.userCarts?[index].cartDetails?.length ?? 0, itemBuilder: (context, indexCart)`
*No documentation provided (generation failed).*

### `CartOrderItem(isOwn: ref.watch(shopProvider).userUuid.isNotEmpty ? (state.cart?.userCarts?[index].uuid == ref.watch(shopProvider).userUuid) : (state.cart?.userCarts?[index].userId == LocalStorage.getUser()?.id), add: () => LocalStorage.getUser()?.id == state.cart?.ownerId ? event.addCount(context, indexCart) : event.addCountWithGroup( context: context, productIndex: indexCart, userIndex: index, ), remove: () => LocalStorage.getUser()?.id == state.cart?.ownerId ? event.removeCount(context, indexCart) : event.removeCountWithGroup( context: context, productIndex: indexCart, userIndex: index, ), cart: state .cart ?.userCarts?[index] .cartDetails?[indexCart], ); }, ), ], ), ), ], ); }, ); } Container bottomWidget( ShopOrderState state, BuildContext context, ShopOrderNotifier event, CustomColorSet colors,)`
*No documentation provided (generation failed).*

### `Container(color: colors.backgroundColor, child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Padding( padding: EdgeInsets.only(right: 16.w, top: 30.h, left: 16.w), child: Column( children: [ ShopOrderDescription( price: ref.watch(shopProvider).shopData?.minPrice ?? 0, svgName: "assets/svgs/delivery.svg", title: AppHelpers.getTranslation(TrKeys.deliveryPrice), description: AppHelpers.getTranslation(TrKeys.startPrice), colors: colors, ), 16.verticalSpace, Divider(color: AppStyle.textGrey.withValues(alpha: 0.1)), if (state.cart?.receiptDiscount != null) ShopOrderDescription( colors: colors, price: state.cart?.receiptDiscount ?? 0, svgName: Assets.svgDiscount, title: AppHelpers.getTranslation(TrKeys.discount), description: AppHelpers.getTranslation( TrKeys.discountProducts, ), discount: true, ), 16.verticalSpace, Divider(color: AppStyle.textGrey.withValues(alpha: 0.1)), ], ), ), 16.verticalSpace, Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text( AppHelpers.getTranslation(TrKeys.total), style: AppStyle.interNormal( size: 14, color: colors.textBlack, ), ), Text( AppHelpers.numberFormat(state.cart?.totalPrice), style: AppStyle.interSemi(size: 20, color: colors.textBlack), ), ], ), ), 16.verticalSpace, Padding( padding: EdgeInsets.only( bottom: MediaQuery.paddingOf(context).bottom + 24.h, right: 16.w, left: 16.w, ), child: CustomButton( background: (state.cart?.group ?? false) && state.isEditOrder && ref.watch(shopProvider).userUuid.isNotEmpty ? AppStyle.transparent : colors.primary, borderColor: (state.cart?.group ?? false) && state.isEditOrder && ref.watch(shopProvider).userUuid.isNotEmpty ? AppStyle.black : colors.primary, title: (state.cart?.ownerId != LocalStorage.getUser()?.id && (state.cart?.group ?? false)) ? (state.isEditOrder ? AppHelpers.getTranslation(TrKeys.isEditOrder) : AppHelpers.getTranslation(TrKeys.done)) : AppHelpers.getTranslation(TrKeys.order), onPressed: ()`
*No documentation provided (generation failed).*

### `OrderRoute()); } }, ), ); } else if (!checkProduct)`
*No documentation provided (generation failed).*

### `OrderRoute()); } } else { Navigator.pop(context); context.pushRoute(const OrderRoute()); } } }, ), ), ], ), ); } Widget _resultEmpty()`
*No documentation provided (generation failed).*

### `Column(children: [ 60.verticalSpace, Lottie.asset('assets/lottie/girl_empty.json', height: 380.r), 24.verticalSpace, Text( AppHelpers.getTranslation(TrKeys.cartIsEmpty), style: AppStyle.interSemi(size: 18.sp), ), ], ); } Widget _customLoading()`
*No documentation provided (generation failed).*
