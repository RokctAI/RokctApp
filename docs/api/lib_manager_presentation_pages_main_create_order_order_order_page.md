# API Reference: order_page

Source file: `lib/manager/presentation/pages/main/create_order/order/order_page.dart`

## Classes

### class `ManagerOrderPage`

## Whitelisted API Endpoints

### `ManagerOrderPage({super.key}); @override ConsumerState<ManagerOrderPage> createState() => _OrderPageState(); } class _OrderPageState extends ConsumerState<ManagerOrderPage> { @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Scaffold(backgroundColor: AppStyle.textGrey, body: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Column(children: [ CustomAppBar( bottomPadding: 16.h, child: Row( crossAxisAlignment: CrossAxisAlignment.end, children: [ ShopBorderedAvatar( size: 40, imageSize: 33, borderRadius: 20, imageUrl: LocalStorage.getShop()?.logoImg, ), 12.horizontalSpace, Expanded( child: Column( crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.end, children: [ Text( LocalStorage.getShop()?.translation?.title ?? '', style: AppStyle.interSemi(size: 18), ), Text( LocalStorage.getShop()?.translation?.description ?? '', style: AppStyle.interRegular( size: 12, letterSpacing: -0.3, ), maxLines: 1, ), ], ), ), ], ), ), Padding( padding: REdgeInsets.only( left: 16, right: 16, top: 24, bottom: 16, ), child: TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.orders), rightTitleColor: AppStyle.red, rightTitle: state.stocks.isEmpty ? null : AppHelpers.getTranslation(TrKeys.clearAllOrders), onRightTap: ()`
*No documentation provided (generation failed).*

### `LoadingList(itemPadding: 2) : ListView.builder( padding: REdgeInsets.only( bottom: MediaQuery.paddingOf(context).bottom + 68, ), shrinkWrap: true, itemCount: paymentState.orderCalculate?.stocks?.length ?? 0, physics: const BouncingScrollPhysics(), itemBuilder: (context, index) => FoodStockItem( product: paymentState.orderCalculate?.stocks?[index], onDelete: () => event.deleteStockFromCart( stock: paymentState.orderCalculate?.stocks?[index] ?? Stock(), updateProducts: (stocks) => productsEvent .updateProducts(cartStocks: stocks), ), ), ), ), ), ], ); }, ), floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked, floatingActionButton: Padding( padding: REdgeInsets.all(16), child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*
