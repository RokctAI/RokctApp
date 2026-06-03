# API Reference: payment_dialog

Source file: `lib/manager/presentation/pages/restaurant/subscriptions/widgets/payment_dialog.dart`

## Classes

### class `PaymentDialog`

## Whitelisted API Endpoints

### `PaymentDialog({super.key}); @override Widget build(BuildContext context, ref)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLrt ? TextDirection.ltr : TextDirection.rtl, child: SizedBox( height: (state.payments?.length ?? 0) > 8 ? MediaQuery.sizeOf(context).height / 1.6 : MediaQuery.sizeOf(context).height / 2, width: MediaQuery.sizeOf(context).width / 2, child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text(AppHelpers.getTranslation(TrKeys.selectPayment)), Expanded( child: ListView.builder( padding: REdgeInsets.symmetric(vertical: 12), itemCount: (state.payments?.length ?? 0), itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `InkWell(onTap: () => notifier.selectPayment(index: index), child: Column( children: [ 8.verticalSpace, Row( children: [ 8.horizontalSpace, Icon( state.selectPayment == index ? FlutterRemix.checkbox_circle_fill : FlutterRemix.checkbox_blank_circle_line, color: state.selectPayment == index ? AppStyle.primary : AppStyle.black, ), 10.horizontalSpace, Text( state.payments?[index].tag ?? "", style: AppStyle.interNormal(size: 14), ), ], ), const Divider(), 8.verticalSpace, ], ), ); }, ), ), CustomButton( isLoading: state.isPaymentLoading, title: TrKeys.payment, onPressed: ()`
*No documentation provided (generation failed).*
