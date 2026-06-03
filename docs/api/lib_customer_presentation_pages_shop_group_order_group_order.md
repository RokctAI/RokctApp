# API Reference: group_order

Source file: `lib/customer/presentation/pages/shop/group_order/group_order.dart`

## Classes

### class `GroupOrderScreen`

## Whitelisted API Endpoints

### `GroupOrderScreen({ super.key, required this.shop, this.cartId, required this.colors, }); @override ConsumerState<ConsumerStatefulWidget> createState() => _GroupOrderPageState(); } class _GroupOrderPageState extends ConsumerState<GroupOrderScreen> { Timer? timer; late CustomColorSet colors; @override void initState()`
*No documentation provided (generation failed).*

### `Duration(seconds: 5), (Timer t)`
*No documentation provided (generation failed).*

### `deactivate()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: Container( decoration: BoxDecoration( color: colors.backgroundColor.withValues(alpha: 0.96), borderRadius: BorderRadius.only( topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r), ), ), width: double.infinity, child: Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: SingleChildScrollView( child: Column( mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [ 8.verticalSpace, Center( child: Container( height: 4.h, width: 48.w, decoration: BoxDecoration( color: AppStyle.dragElement, borderRadius: BorderRadius.all(Radius.circular(40.r)), ), ), ), 14.verticalSpace, TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.startGroupOrder), paddingHorizontalSize: 0, ), 10.verticalSpace, Text( AppHelpers.getTranslation(TrKeys.youFullyManaga), style: AppStyle.interRegular( size: 14, color: AppStyle.textGrey, ), ), 30.verticalSpace, Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ Container( width: 220.w, height: 46.h, padding: EdgeInsets.symmetric( vertical: 12.h, horizontal: 16.w, ), decoration: BoxDecoration( color: colors.icon, borderRadius: BorderRadius.circular(10.r), boxShadow: [ BoxShadow( color: AppStyle.black.withValues(alpha: 0.04), spreadRadius: 0, blurRadius: 2, offset: const Offset( 0, 2, ), ), ], ), child: Text( state.shareLink, style: AppStyle.interRegular( size: 14, color: AppStyle.textGrey, ), overflow: TextOverflow.ellipsis, ), ), GestureDetector( onTap: () async { AppHelpers.showCheckTopSnackBarDone( context, AppHelpers.getTranslation(TrKeys.coped), ); await Clipboard.setData( ClipboardData(text: state.shareLink), ); }, child: Container( width: 46.w, height: 46.h, decoration: BoxDecoration( color: colors.icon, borderRadius: BorderRadius.circular(10.r), boxShadow: [ BoxShadow( color: AppStyle.black.withValues(alpha: 0.04), spreadRadius: 0, blurRadius: 2, offset: const Offset( 0, 2, ), ), ], ), child: const Icon( FlutterRemix.file_copy_fill, color: AppStyle.textGrey, ), ), ), GestureDetector( onTap: ()`
*No documentation provided (generation failed).*

### `Offset(0, 2, ), ), ], ), child: const Icon( FlutterRemix.share_fill, color: AppStyle.textGrey, ), ), ), ], ), Column( children: [ 20.verticalSpace, TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.groupMember), paddingHorizontalSize: 0, titleSize: 14, ), 8.verticalSpace, ListView.builder( shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), itemCount: state.cart?.userCarts?.length ?? 0, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `GroupItem(colors: colors, name: state.cart?.userCarts?[index].name ?? "", price: total, isChoosing: state.cart?.userCarts?[index].status ?? false, onDelete: ()`
*No documentation provided (generation failed).*

### `OrderRoute()); } }, ), ); } else if (!checkProduct)`
*No documentation provided (generation failed).*

### `OrderRoute()); } }, ), ) : const SizedBox.shrink(), Padding( padding: EdgeInsets.only( bottom: MediaQuery.paddingOf(context).bottom + 16.h, ), child: CustomButton( title: AppHelpers.getTranslation( LocalStorage.getUser()?.id == state.cart?.ownerId ? TrKeys.cancel : TrKeys.leaveGroup, ), borderColor: AppStyle.black, background: AppStyle.transparent, onPressed: ()`
*No documentation provided (generation failed).*
