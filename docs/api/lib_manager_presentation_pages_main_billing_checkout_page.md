# API Reference: checkout_page

Source file: `lib/manager/presentation/pages/main/billing/checkout_page.dart`

## Classes

### class `ManagerCheckoutPage`

## Whitelisted API Endpoints

### `ManagerCheckoutPage({super.key}); @override ConsumerState<ManagerCheckoutPage> createState() => _ManagerCheckoutPageState(); } class _ManagerCheckoutPageState extends ConsumerState<ManagerCheckoutPage> { bool isWaitingForPayment = false; final TextEditingController otpController = TextEditingController(); String? errorMessage; @override void dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Scaffold(backgroundColor: AppStyle.white, appBar: AppBar( backgroundColor: AppStyle.white, elevation: 0, leading: IconButton( icon: const Icon(FlutterRemix.arrow_left_line, color: AppStyle.black), onPressed: () => Navigator.pop(context), ), title: Text( AppHelpers.getTranslation(TrKeys.checkout), style: AppStyle.interSemi(size: 18.sp), ), ), body: Padding( padding: EdgeInsets.symmetric(horizontal: 16.w), child: SingleChildScrollView( child: Column( children: [ RestaurantItem( shopName: shopData?.translation?.title ?? "Manager POS", shopImage: shopData?.logoImg ?? "", shopText: isWaitingForPayment ? "Waiting for Payment..." : "Active Transaction", shopUid: shopId, shopId: shopId, ), 24.verticalSpace, if (!isWaitingForPayment) ...[ Container( decoration: BoxDecoration( borderRadius: BorderRadius.circular(10.r), border: Border.all(color: AppStyle.shimmerBase), ), padding: EdgeInsets.all(12.r), child: Row( children: [ const Icon( FlutterRemix.qr_code_line, color: AppStyle.blue, ), 12.horizontalSpace, Expanded( child: Text( "Let the customer scan this QR to pay online.", style: AppStyle.interRegular(size: 14.sp), ), ), ], ), ), 32.verticalSpace, Center( child: SizedBox( width: 220.r, height: 220.r, child: PrettyQrView.data( data: paymentUrl, decoration: PrettyQrDecoration( image: PrettyQrDecorationImage( image: shopData?.logoImg != null && shopData!.logoImg!.isNotEmpty ? NetworkImage(shopData.logoImg!) as ImageProvider : const AssetImage('assets/image/manager.png'), ), ), ), ), ), 24.verticalSpace, CustomButton( title: "I've Scanned, Wait for Code", background: AppStyle.blue.withOpacity(0.1), textColor: AppStyle.blue, onPressed: () => setState(() => isWaitingForPayment = true), ), ] else ...[ Container( decoration: BoxDecoration( color: AppStyle.blue.withOpacity(0.05), borderRadius: BorderRadius.circular(12.r), border: Border.all(color: AppStyle.blue.withOpacity(0.2)), ), padding: EdgeInsets.all(20.r), child: Column( children: [ Text( "Waiting for Payment", style: AppStyle.interSemi( size: 18.sp, color: AppStyle.blue, ), ), 12.verticalSpace, Text( "Enter the 5-digit verification code provided by the customer after successful payment.", textAlign: TextAlign.center, style: AppStyle.interRegular( size: 14.sp, color: AppStyle.textGrey, ), ), 24.verticalSpace, CustomTextField( controller: otpController, label: "5-Digit Code", inputType: TextInputType.number, maxLength: 5, textAlign: TextAlign.center, onChanged: (val)`
*No documentation provided (generation failed).*

### `setState(() => isWaitingForPayment = false), child: Text( "Show QR Code Again", style: AppStyle.interRegular(color: AppStyle.textGrey), ), ), ], 32.verticalSpace, Container( padding: EdgeInsets.all(16.r), decoration: BoxDecoration( color: AppStyle.bgGray, borderRadius: BorderRadius.circular(12.r), ), child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ Text( AppHelpers.getTranslation(TrKeys.total), style: AppStyle.interSemi(size: 16.sp), ), Text( AppHelpers.numberFormat(num: cartState.totalPrice), style: AppStyle.interBold( size: 18.sp, color: AppStyle.blue, ), ), ], ), ), 40.verticalSpace, Row( children: [ Expanded( child: OutlinedButton( style: OutlinedButton.styleFrom( padding: EdgeInsets.symmetric(vertical: 16.h), shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(12.r), ), side: const BorderSide(color: AppStyle.blue), ), onPressed: ()`
*No documentation provided (generation failed).*
