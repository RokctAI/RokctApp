# API Reference: price_information

Source file: `lib/manager/presentation/pages/main/orders/details/price_information.dart`

## Classes

### class `PriceInformation`

## Whitelisted API Endpoints

### `PriceInformation({super.key, required this.order, this.isHistoryOrder}); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Container(decoration: BoxDecoration( color: AppStyle.white, borderRadius: BorderRadius.circular(10.r), ), margin: REdgeInsets.only(top: 8), padding: REdgeInsets.symmetric(horizontal: 16), child: ExpansionTile( initiallyExpanded: isHistoryOrder ?? false, tilePadding: EdgeInsets.zero, title: Text(AppHelpers.getTranslation(TrKeys.priceInformation)), childrenPadding: REdgeInsets.only(bottom: 18), textColor: AppStyle.black, iconColor: AppStyle.black, children: [ _priceItem(title: TrKeys.subtotal, price: order?.originPrice), _priceItem(title: TrKeys.tax, price: order?.tax), _priceItem(title: TrKeys.serviceFee, price: order?.serviceFee), _priceItem(title: TrKeys.deliveryFee, price: order?.deliveryFee), _priceItem(title: TrKeys.tips, price: order?.tips), _priceItem( isDiscount: true, title: TrKeys.discount, price: order?.totalDiscount, ), _priceItem( isDiscount: true, title: TrKeys.coupon, price: order?.couponPrice, ), _priceItem( isTotal: true, title: TrKeys.total, price: order?.totalPrice, ), ], ), ); } RenderObjectWidget _priceItem({ required String title, required num? price, bool isTotal = false, bool isDiscount = false, })`
*No documentation provided (generation failed).*
