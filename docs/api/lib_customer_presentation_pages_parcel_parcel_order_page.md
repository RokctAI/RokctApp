# API Reference: parcel_order_page

Source file: `lib/customer/presentation/pages/parcel/parcel_order_page.dart`

## Classes

### class `ParcelProgressPage`

## Whitelisted API Endpoints

### `ParcelProgressPage({super.key, this.parcelId}); @override ConsumerState<ParcelProgressPage> createState() => _ParcelProgressPageState(); } class _ParcelProgressPageState extends ConsumerState<ParcelProgressPage> { RefreshController refreshController = RefreshController(); late ParcelNotifier event; late bool isLtr; Timer? timer; @override void initState()`
*No documentation provided (generation failed).*

### `Duration(seconds: 120), (Timer t)`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: KeyboardDismisser( child: CustomScaffold( body: (colors) => state.isLoading ? const Loading() : Column( mainAxisSize: MainAxisSize.min, children: [ _appBar(context, state, colors), Expanded( child: SmartRefresher( enablePullDown: true, enablePullUp: false, controller: refreshController, onRefresh: ()`
*No documentation provided (generation failed).*

### `BoxDecoration(color: AppStyle.textGrey, shape: BoxShape.circle, ), ), Text( TimeService.dateFormatMDHm( state.parcel?.createdAt, ), style: AppStyle.interNormal( size: 14, color: AppStyle.textGrey, ), ), ], ), 16.verticalSpace, const Divider(color: AppStyle.textGrey), 16.verticalSpace, Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text( AppHelpers.getTranslation( TrKeys.deliveryAddress, ), style: AppStyle.interRegular( size: 14, color: AppStyle.textGrey, ), ), Text( state.parcel?.addressTo?.address ?? "", style: AppStyle.interNoSemi( size: 16, color: colors.textBlack, ), ), ], ), 16.verticalSpace, const Divider(color: AppStyle.textGrey), 16.verticalSpace, TitleAndPrice( title: AppHelpers.getTranslation( TrKeys.total, ), rightTitle: AppHelpers.numberFormat( state.parcel?.totalPrice, symbol: state.parcel?.currency?.symbol, isOrder: true, ), textStyle: AppStyle.interSemi( size: 20, color: colors.textBlack, ), ), ], ), ), 100.verticalSpace, ], ), ), ), ), ], ), floatingActionButtonLocation: FloatingActionButtonLocation.startFloat, floatingActionButton: (colors) => Padding( padding: EdgeInsets.only(left: 16.w), child: const PopButton(), ), ), ), ); } CommonAppBar _appBar( BuildContext context, ParcelState state, CustomColorSet colors,)`
*No documentation provided (generation failed).*
