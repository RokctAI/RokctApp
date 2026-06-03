# API Reference: order_progress_screen

Source file: `lib/customer/presentation/pages/order/order_screen/order_progress_screen.dart`

## Classes

### class `OrderProgressPage`

## Whitelisted API Endpoints

### `OrderProgressPage({super.key, required this.orderId}); @override ConsumerState<OrderProgressPage> createState() => _OrderProgressPageState(); } class _OrderProgressPageState extends ConsumerState<OrderProgressPage> { RefreshController refreshController = RefreshController(); final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); late OrderNotifier event; late bool isLtr; Timer? timer; WebSocketOrderClient? _socket; @override void initState()`
*No documentation provided (generation failed).*

### `Duration(seconds: 120), (Timer t)`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: ThemeWrapper( builder: (colors, theme)`
*No documentation provided (generation failed).*

### `KeyboardDismisser(child: Scaffold( key: _scaffoldKey, resizeToAvoidBottomInset: false, backgroundColor: colors.backgroundColor, body: state.isLoading ? const Loading() : Column( mainAxisSize: MainAxisSize.min, children: [ _appBar(context, state, colors), _orderScreen(event, context, state, colors), ], ), floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, floatingActionButton: _bottom(context), ), ); }, ), ); } Widget _bottom(BuildContext context)`
*No documentation provided (generation failed).*

### `Padding(padding: EdgeInsets.symmetric(horizontal: 16.w), child: Row(children: [const PopButton(), 16.horizontalSpace]), ); } Widget _orderScreen( OrderNotifier event, BuildContext context, OrderState state, CustomColorSet colors,)`
*No documentation provided (generation failed).*

### `Expanded(child: SmartRefresher( enablePullDown: true, enablePullUp: false, controller: refreshController, onRefresh: ()`
*No documentation provided (generation failed).*

### `NeverScrollableScrollPhysics(), shrinkWrap: true, itemCount: ref.watch(orderProvider).orderData?.details?.length ?? 0, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `CartOrderItem(isAddComment: true, status: state.orderData?.status, symbol: state.orderData?.currencyModel?.symbol ?? "", isActive: false, add: ()`
*No documentation provided (generation failed).*
