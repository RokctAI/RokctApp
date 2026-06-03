# API Reference: payment_method

Source file: `lib/customer/presentation/pages/order/order_check/widgets/payment_method.dart`

## Classes

### class `PaymentMethods`

## Whitelisted API Endpoints

### `Function(PaymentData, num)? tips; final num? tipPrice; final CustomColorSet colors; const PaymentMethods({ this.payLater, this.tips, this.tipPrice, super.key, required this.colors, }); @override ConsumerState<PaymentMethods> createState() => _PaymentMethodsState(); } class _PaymentMethodsState extends ConsumerState<PaymentMethods> { final bool isLtr = LocalStorage.getLangLtr(); late PaymentNotifier event; late PaymentState state; @override void initState()`
*No documentation provided (generation failed).*

### `didChangeDependencies()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: Container( decoration: BoxDecoration( color: widget.colors.backgroundColor.withValues(alpha: 0.96), borderRadius: BorderRadius.only( topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r), ), ), width: double.infinity, child: state.isPaymentsLoading ? const Loading() : SingleChildScrollView( child: Column( children: [ Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Column( mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [ 8.verticalSpace, Center( child: Container( height: 4.h, width: 48.w, decoration: BoxDecoration( color: AppStyle.dragElement, borderRadius: BorderRadius.all( Radius.circular(40.r), ), ), ), ), 14.verticalSpace, TitleAndIcon( title: AppHelpers.getTranslation( TrKeys.paymentMethods, ), ), 24.verticalSpace, (state.payments.isNotEmpty) ? ListView.builder( physics: const NeverScrollableScrollPhysics(), shrinkWrap: true, itemCount: state.payments.length, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `SelectItem(onTap: () => event.change(index), isActive: state.currentIndex == index, title: AppHelpers.getTranslation( state.payments[index].tag ?? "", ), ); }, ) : Center( child: Padding( padding: EdgeInsets.only( bottom: 32.h, left: 24.w, right: 24.w, ), child: Text( AppHelpers.getTranslation( TrKeys.paymentTypeIsNotAdded, ), style: AppStyle.interSemi( size: 16, color: AppStyle.textGrey, ), textAlign: TextAlign.center, ), ), ), if (widget.payLater != null) Padding( padding: EdgeInsets.only(bottom: 32.r), child: CustomButton( title: AppHelpers.getTranslation(TrKeys.pay), onPressed: ()`
*No documentation provided (generation failed).*
