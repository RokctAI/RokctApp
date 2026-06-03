# API Reference: order_screen

Source file: `lib/customer/presentation/pages/order/order_screen/order_screen.dart`

## Classes

### class `OrderPage`

## Whitelisted API Endpoints

### `OrderPage({super.key}); @override ConsumerState<OrderPage> createState() => _OrderPageState(); } class _OrderPageState extends ConsumerState<OrderPage> with SingleTickerProviderStateMixin { late RefreshController refreshController; late TabController _tabController; late ConfettiController _controllerCenter; late double long; late double lat; int tabIndex = 0; int reviewOpen = 1; bool check = false; void getAddress()`
*No documentation provided (generation failed).*

### `initState()`
*No documentation provided (generation failed).*

### `Duration(seconds: 2), ); refreshController = RefreshController(); if (ref.read(shopOrderProvider).cart != null)`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: KeyboardDismisser( child: ConfettiWidget( blastDirectionality: BlastDirectionality.explosive, confettiController: _controllerCenter, particleDrag: 0.02, emissionFrequency: 0.02, numberOfParticles: 45, gravity: 0.1, shouldLoop: false, displayTarget: true, child: ThemeWrapper( builder: (colors, theme)`
*No documentation provided (generation failed).*

### `CustomScaffold(body: (colors) => check ? _resultEmpty(colors) : state.isLoading ? const Loading() : _orderScreen(context, state, event, colors), floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, floatingActionButton: (colors) => _bottom(state, context), ); }, ), ), ), ); } Widget _bottom(OrderState state, BuildContext context)`
*No documentation provided (generation failed).*

### `Padding(padding: EdgeInsets.symmetric(horizontal: 16.w), child: Row(children: [const PopButton(), 16.horizontalSpace]), ); } Widget _orderScreen( BuildContext context, OrderState state, OrderNotifier event, CustomColorSet colors,)`
*No documentation provided (generation failed).*

### `Column(mainAxisSize: MainAxisSize.min, children: [ _appBar(context, state, colors), Expanded( child: SmartRefresher( enablePullDown: state.orderData != null, enablePullUp: false, controller: state.orderData == null ? RefreshController() : refreshController, onRefresh: ()`
*No documentation provided (generation failed).*

### `Column(children: [ 100.verticalSpace, l.Lottie.asset('assets/lottie/girl_empty.json'), 24.verticalSpace, Text( AppHelpers.getTranslation(TrKeys.cartIsEmpty), style: AppStyle.interSemi(size: 18.sp, color: colors.textBlack), ), ], ); } CommonAppBar _appBar( BuildContext context, OrderState state, CustomColorSet colors,)`
*No documentation provided (generation failed).*

### `CommonAppBar(height: state.orderData != null ? 170 : 70, child: Column( mainAxisAlignment: MainAxisAlignment.end, children: [ Row( crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.start, children: [ ShopAvatar( shopImage: state.orderData == null ? (state.shopData?.logoImg ?? "") : (state.orderData?.shop?.logoImg ?? ""), size: 40, padding: 4, radius: 8, bgColor: AppStyle.black.withValues(alpha: 0.06), ), 10.horizontalSpace, SizedBox( width: MediaQuery.sizeOf(context).width - 86.w, child: Column( crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceAround, children: [ Text( state.orderData == null ? (state.shopData?.translation?.title ?? "") : (state.orderData?.shop?.translation?.title ?? ""), style: AppStyle.interSemi( size: 16, color: colors.textBlack, ), maxLines: 1, overflow: TextOverflow.ellipsis, ), Text( state.orderData == null ? (state.shopData?.translation?.description ?? "") : (state.orderData?.shop?.translation?.description ?? ""), style: AppStyle.interNormal( size: 12, color: colors.textBlack, ), maxLines: 1, overflow: TextOverflow.ellipsis, ), ], ), ), ], ), state.orderData != null ? OrderStatusScreen( status: AppHelpers.getOrderStatus( state.orderData?.status ?? "", ), colors: colors, ) : const SizedBox.shrink(), ], ), ); } } Widget _customLoading()`
*No documentation provided (generation failed).*
