# API Reference: order_button

Source file: `lib/customer/presentation/pages/order/order_check/widgets/order_button.dart`

## Classes

### class `OrderButton`

## Whitelisted API Endpoints

### `OrderButton({ super.key, required this.isOrder, required this.orderStatus, required this.createOrder, required this.isAutoLoading, required this.isLoading, required this.cancelOrder, required this.callShop, required this.callDriver, required this.sendSmsDriver, required this.isRefund, required this.repeatOrder, required this.isRepeatLoading, required this.showImage, required this.autoOrder, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ SizedBox( width: (MediaQuery.sizeOf(context).width - 60) / 2, child: CustomButton( isLoading: isLoading, background: AppStyle.black, textColor: AppStyle.white, title: AppHelpers.getTranslation(TrKeys.callTheDriver), onPressed: callDriver, ), ), SizedBox( width: (MediaQuery.sizeOf(context).width - 60) / 2, child: CustomButton( isLoading: isLoading, background: AppStyle.black, textColor: AppStyle.white, title: AppHelpers.getTranslation(TrKeys.sendMessage), onPressed: sendSmsDriver, ), ), ], ); case OrderStatus.open: return CustomButton( isLoading: isLoading, background: AppStyle.red, textColor: AppStyle.white, title: AppHelpers.getTranslation(TrKeys.cancelOrder), onPressed: cancelOrder, ); case OrderStatus.accepted: return CustomButton( isLoading: isLoading, background: AppStyle.black, textColor: AppStyle.white, title: AppHelpers.getTranslation(TrKeys.callCenterRestaurant), onPressed: callShop, ); case OrderStatus.ready: return CustomButton( isLoading: isLoading, background: AppStyle.black, textColor: AppStyle.white, title: AppHelpers.getTranslation(TrKeys.callCenterRestaurant), onPressed: callShop, ); case OrderStatus.delivered: return isRefund ? Column( children: [ if (showImage != null) GestureDetector( onTap: showImage, child: Container( margin: EdgeInsets.only(top: 8.h), decoration: BoxDecoration( color: AppStyle.transparent, border: Border.all(color: AppStyle.black, width: 2), borderRadius: BorderRadius.circular(10.r), ), padding: REdgeInsets.all(16), child: Row( mainAxisAlignment: MainAxisAlignment.center, children: [ Text( AppHelpers.getTranslation(TrKeys.orderImage), style: AppStyle.interNormal( size: 14, color: AppStyle.black, letterSpacing: -0.3, ), ), 12.horizontalSpace, const Icon(FlutterRemix.gallery_fill), ], ), ), ), 10.verticalSpace, CustomButton( isLoading: isAutoLoading, background: AppStyle.transparent, borderColor: AppStyle.black, textColor: AppStyle.black, title: AppHelpers.getTranslation(TrKeys.autoOrder), onPressed: autoOrder, ), 10.verticalSpace, CustomButton( isLoading: isRepeatLoading, background: AppStyle.transparent, borderColor: AppStyle.black, textColor: AppStyle.black, title: AppHelpers.getTranslation(TrKeys.repeatOrder), onPressed: repeatOrder, ), 10.verticalSpace, CustomButton( isLoading: isLoading, title: AppHelpers.getTranslation(TrKeys.reFound), background: AppStyle.red, textColor: AppStyle.white, onPressed: ()`
*No documentation provided (generation failed).*

### `RefundScreen(), isDarkMode: false, ); }, ), ], ) : const SizedBox.shrink(); case OrderStatus.canceled: return const SizedBox.shrink(); } } else { return Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*
