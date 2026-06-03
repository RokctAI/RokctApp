# API Reference: delivery_time_page

Source file: `lib/manager/presentation/pages/main/create_order/shipping/details/delivery_time_page.dart`

## Classes

### class `ManagerDeliveryTimePage`

## Whitelisted API Endpoints

### `ManagerDeliveryTimePage({super.key}); @override ConsumerState<ManagerDeliveryTimePage> createState() => _DeliveryTimePageState(); } class _DeliveryTimePageState extends ConsumerState<ManagerDeliveryTimePage> { @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `KeyboardDisable(child: Scaffold( resizeToAvoidBottomInset: false, backgroundColor: AppStyle.textGrey, body: Container( padding: MediaQuery.viewInsetsOf(context), child: SingleChildScrollView( padding: EdgeInsets.only( bottom: MediaQuery.paddingOf(context).bottom + 48.h, ), child: Column( children: [ Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Container(decoration: BoxDecoration( color: AppStyle.white, borderRadius: BorderRadius.only( bottomLeft: Radius.circular(10.r), bottomRight: Radius.circular(10.r), ), ), padding: REdgeInsets.only( top: MediaQuery.paddingOf(context).top + 26, left: 16, right: 16, bottom: 16, ), child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Column(children: [ TitleAndIcon( title: AppHelpers.getTranslation( TrKeys.deliveryTime, ), ), 24.verticalSpace, Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ Text( AppHelpers.getTranslation( TrKeys.selectedTimeAndDay, ), style: AppStyle.interSemi( size: 14, letterSpacing: -0.3, ), ), GestureDetector( onTap: () => AppHelpers.showCustomModalBottomSheet( paddingTop: MediaQuery.paddingOf( context, ).top, context: context, radius: 12, modal: SelectDateModal( initialDate: timeState.deliveryDate, onDateSaved: (date) => timeEvent.setDeliveryDate( date.toString().substring( 0, 10, ), ), ), isDarkMode: true, ), child: Text( timeState.deliveryDate, style: AppStyle.interNormal( size: 14, letterSpacing: -0.3, ), ), ), ], ), ], ); }, ), ); }, ), Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Container(margin: EdgeInsets.symmetric(vertical: 10.h), decoration: BoxDecoration( color: AppStyle.white, borderRadius: BorderRadius.circular(10.r), ), padding: REdgeInsets.symmetric( vertical: 24, horizontal: 16, ), child: Column( children: [ TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.payment), ), Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `NeverScrollableScrollPhysics(), itemBuilder: (context, index) => PaymentItem( payment: paymentState.payments[index], isSelected: paymentState.selectedIndex == index, isLast: paymentState.payments.length == index + 1, onTap: () => paymentEvent .setSelectedIndex(index), ), ); }, ), ], ), ); }, ), Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Container(margin: EdgeInsets.symmetric(vertical: 10.h), decoration: BoxDecoration( color: AppStyle.white, borderRadius: BorderRadius.circular(10.r), ), padding: EdgeInsets.symmetric(vertical: 24.h), child: state.isCalculateLoading ? const Loading() : Column( children: [ Padding( padding: EdgeInsets.symmetric( horizontal: 16.w, ), child: TitleAndIcon( title: "${AppHelpers.getTranslation(TrKeys.payment)} - \$", ), ), 24.verticalSpace, TitleAndPrice( title: AppHelpers.getTranslation( TrKeys.subtotal, ), rightTitle: AppHelpers.numberFormat( state.orderCalculate?.price ?? 0, ), textStyle: AppStyle.interRegular( size: 16, letterSpacing: -0.3, ), ), 16.verticalSpace, TitleAndPrice( title: AppHelpers.getTranslation( TrKeys.deliveryPrice, ), rightTitle: AppHelpers.numberFormat( state.orderCalculate?.deliveryFee ?? 0, ), textStyle: AppStyle.interRegular( size: 16, letterSpacing: -0.3, ), ), 16.verticalSpace, TitleAndPrice( title: AppHelpers.getTranslation( TrKeys.serviceFee, ), rightTitle: AppHelpers.numberFormat( state.orderCalculate?.serviceFee ?? 0, ), textStyle: AppStyle.interRegular( size: 16, letterSpacing: -0.3, ), ), 16.verticalSpace, TitleAndPrice( title: AppHelpers.getTranslation( TrKeys.discount, ), rightTitle: '-${AppHelpers.numberFormat(state.orderCalculate?.totalDiscount ?? 0)}', textStyle: AppStyle.interRegular( size: 16, letterSpacing: -0.3, ), ), 16.verticalSpace, TitleAndPrice( title: AppHelpers.getTranslation( TrKeys.totalTax, ), rightTitle: AppHelpers.numberFormat( state.orderCalculate?.totalShopTax ?? 0, ), textStyle: AppStyle.interRegular( size: 16, letterSpacing: -0.3, ), ), 16.verticalSpace, const Divider(color: AppStyle.shimmerBase), 16.verticalSpace, TitleAndPrice( title: AppHelpers.getTranslation( TrKeys.total, ), rightTitle: AppHelpers.numberFormat( state.orderCalculate?.totalPrice ?? 0, ), textStyle: AppStyle.interSemi( size: 20, letterSpacing: -0.3, ), ), ], ), ); }, ), ], ), ), ), floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked, floatingActionButton: Padding( padding: REdgeInsets.all(16), child: Row( children: [ const PopButton(heroTag: AppConstants.heroTagAddOrderButton), 8.horizontalSpace, Expanded( child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `CustomButton(title: AppHelpers.getTranslation(TrKeys.next), isLoading: ref.watch(createOrderProvider).isCreating, onPressed: ()`
*No documentation provided (generation failed).*
