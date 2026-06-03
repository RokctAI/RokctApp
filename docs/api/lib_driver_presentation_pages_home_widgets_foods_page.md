# API Reference: foods_page

Source file: `lib/driver/presentation/pages/home/widgets/foods_page.dart`

## Classes

### class `FoodsPage`

## Whitelisted API Endpoints

### `FoodsPage({super.key, required this.order}); @override ConsumerState<FoodsPage> createState() => _FoodsPageState(); } class _FoodsPageState extends ConsumerState<FoodsPage> { bool hasData = true; @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Loading() : SingleChildScrollView( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Column( mainAxisSize: MainAxisSize.min, children: [ TitleAndIcon(title: AppHelpers.getTranslation(TrKeys.foods)), 16.verticalSpace, Container( decoration: BoxDecoration( borderRadius: BorderRadius.circular(10.r), color: AppStyle.white, ), padding: EdgeInsets.all(16.r), child: Column( children: [ ListView.builder( shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), itemCount: hasData ? (widget.order.details?.length ?? 0) : (state.order?.details?.length ?? 0), itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `Padding(padding: EdgeInsets.symmetric(vertical: 6.h), child: Column( children: [ ProductItem( product: hasData ? (widget .order .details?[index] .stock ?.product) : (state .order ?.details?[index] .stock ?.product), amount: hasData ? (widget.order.details?[index].quantity) : (state.order?.details?[index].quantity), price: AppHelpers.numberFormat( number: hasData ? (widget .order .details?[index] .totalPrice) : state .order ?.details?[index] .totalPrice, ), ), if (state.order?.details?[index].note != null && state.order?.details?[index].note != '') Text( "${AppHelpers.getTranslation(TrKeys.note)}: ${state.order?.details?[index].note}", style: AppStyle.interRegular( color: AppStyle.blackColor, size: 14.sp, letterSpacing: -0.3, ), ), ], ), ); }, ), _priceItem( title: TrKeys.subtotal, price: hasData ? widget.order.originPrice : state.order?.originPrice, ), _priceItem( title: TrKeys.tax, price: hasData ? widget.order.tax : state.order?.tax, ), _priceItem( title: TrKeys.serviceFee, price: hasData ? widget.order.serviceFee : state.order?.serviceFee, ), _priceItem( title: TrKeys.deliveryFee, price: hasData ? widget.order.deliveryFee : state.order?.deliveryFee, ), _priceItem( isDiscount: true, title: TrKeys.discount, price: hasData ? widget.order.totalDiscount : state.order?.totalDiscount, ), _priceItem( isDiscount: true, title: TrKeys.coupon, price: state.order?.couponPrice, ), _priceItem( isTotal: true, title: TrKeys.total, price: hasData ? widget.order.totalPrice : state.order?.totalPrice, ), ], ), ), 16.verticalSpace, ], ), ); } RenderObjectWidget _priceItem({ required String title, required num? price, bool isTotal = false, bool isDiscount = false, })`
*No documentation provided (generation failed).*
