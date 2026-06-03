# API Reference: order_check

Source file: `lib/customer/presentation/pages/order/order_check/order_check.dart`

## Classes

### class `OrderCheck`

## Whitelisted API Endpoints

### `OrderCheck({ super.key, required this.isActive, required this.isOrder, required this.orderStatus, this.globalKey, this.controllerCenter, required this.colors, }); @override State<OrderCheck> createState() => _OrderCheckState(); } class _OrderCheckState extends State<OrderCheck> { void _createOrder({ required OrderState state, required OrderNotifier event, required ShopOrderState stateOrderShop, required ShopOrderNotifier eventShopOrder, required ViewMapState stateMap, required PaymentState paymentState, required ProfileState stateProfile, required OrdersListNotifier eventOrderList, })`
*No documentation provided (generation failed).*

### `WebViewPage(url: s)), ).whenComplete(()`
*No documentation provided (generation failed).*

### `CustomButton(isLoading: ref.watch(shopOrderProvider).isDeleteLoading, title: AppHelpers.getTranslation(TrKeys.clearAll), onPressed: ()`
*No documentation provided (generation failed).*

### `OrderRoute()); }, ); }, ); }, ); }, ), ), ], ), ], ), ); } @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `ThemeWrapper(builder: (colors, theme)`
*No documentation provided (generation failed).*

### `Container(width: double.infinity, decoration: BoxDecoration( color: colors.backgroundColor, borderRadius: BorderRadius.only( topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r), ), ), padding: EdgeInsets.symmetric(vertical: 16.h), child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Column(mainAxisSize: MainAxisSize.min, children: [ widget.isOrder ? OrderInfo(colors: colors) : CardAndPromo(colors: colors), PriceInformation( isOrder: widget.isOrder, state: state, colors: colors, ), const DeliveryInfo(), 26.verticalSpace, Padding( padding: EdgeInsets.only( bottom: MediaQuery.paddingOf(context).bottom, right: 16.w, left: 16.w, ), child: OrderButton( autoOrder: ()`
*No documentation provided (generation failed).*

### `launchUrl(launchUri); }, callDriver: () async { if (state.orderData?.deliveryMan != null)`
*No documentation provided (generation failed).*

### `launchUrl(launchUri); } else { AppHelpers.showCheckTopSnackBarInfo( context, AppHelpers.getTranslation(TrKeys.noDriver), ); } }, sendSmsDriver: () async { if (state.orderData?.deliveryMan != null)`
*No documentation provided (generation failed).*

### `launchUrl(launchUri); } else { AppHelpers.showCheckTopSnackBarInfo( context, AppHelpers.getTranslation(TrKeys.noDriver), ); } }, isRefund: (state.orderData?.refunds?.isEmpty ?? true) || state.orderData?.refunds?.last.status == "canceled", repeatOrder: ()`
*No documentation provided (generation failed).*

### `OrderRoute()); }, ); }, ); }, showImage: state.orderData?.afterDeliveredImage != null ? ()`
*No documentation provided (generation failed).*
