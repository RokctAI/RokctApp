# API Reference: parcel_payments

Source file: `lib/customer/presentation/pages/parcel/widgets/parcel_payments.dart`

## Classes

### class `ParcelPayments`

## Whitelisted API Endpoints

### `ParcelPayments({this.payLater, super.key}); @override ConsumerState<ParcelPayments> createState() => _PaymentMethodsState(); } class _PaymentMethodsState extends ConsumerState<ParcelPayments> { final bool isLtr = LocalStorage.getLangLtr(); late PaymentNotifier event; late PaymentState state; @override void didChangeDependencies()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: Container( decoration: BoxDecoration( color: AppStyle.bgGrey.withValues(alpha: 0.96), borderRadius: BorderRadius.only( topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r), ), ), width: double.infinity, child: state.isPaymentsLoading ? const Loading() : SingleChildScrollView( padding: EdgeInsets.symmetric(horizontal: 16.w), child: Column( mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [ 8.verticalSpace, Center( child: Container( height: 4.h, width: 48.w, decoration: BoxDecoration( color: AppStyle.dragElement, borderRadius: BorderRadius.circular(40.r), ), ), ), 14.verticalSpace, TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.paymentMethods), ), 24.verticalSpace, (state.payments.isNotEmpty) ? ListView.builder( physics: const NeverScrollableScrollPhysics(), shrinkWrap: true, itemCount: state.payments.length, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `SelectItem(onTap: () => event.change(index), isActive: state.currentIndex == index, title: AppHelpers.getTranslation( state.payments[index].tag ?? "", ), ); }, ) : Center( child: Padding( padding: EdgeInsets.only( bottom: 32.h, left: 24.w, right: 24.w, ), child: Text( AppHelpers.getTranslation( TrKeys.paymentTypeIsNotAdded, ), style: AppStyle.interSemi( size: 16, color: AppStyle.textGrey, ), textAlign: TextAlign.center, ), ), ), if (widget.payLater != null) Padding( padding: EdgeInsets.only(bottom: 32.r), child: CustomButton( title: AppHelpers.getTranslation(TrKeys.pay), onPressed: ()`
*No documentation provided (generation failed).*
