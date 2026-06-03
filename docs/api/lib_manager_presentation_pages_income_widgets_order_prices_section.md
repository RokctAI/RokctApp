# API Reference: order_prices_section

Source file: `lib/manager/presentation/pages/income/widgets/order_prices_section.dart`

## Classes

### class `OrderPricesSection`

## Whitelisted API Endpoints

### `OrderPricesSection({super.key, this.endTime, this.startTime}); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Consumer(builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Column(children: [ Container( width: double.infinity, decoration: BoxDecoration( color: AppStyle.white, borderRadius: BorderRadius.circular(10.r), ), padding: REdgeInsets.all(16), child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text( AppHelpers.getTranslation(TrKeys.orderPrice), style: AppStyle.interNormal( size: 14, color: AppStyle.blackColor, letterSpacing: -0.3, ), ), 16.verticalSpace, Text( AppHelpers.numberFormat( state.countData?.lastOrderTotalPrice ?? 0, ), style: AppStyle.interSemi( size: 32, color: AppStyle.blackColor, letterSpacing: -0.3, ), ), 4.verticalSpace, RichText( text: TextSpan( text: AppHelpers.getTranslation(TrKeys.lastIncome), style: AppStyle.interNormal( size: 12, color: AppStyle.blackColor, letterSpacing: -0.3, ), children: [ TextSpan( text: AppHelpers.numberFormat( state.countData?.lastOrderIncome ?? 0, ), style: AppStyle.interSemi( size: 12, color: AppStyle.blackColor, letterSpacing: -0.3, ), ), ], ), ), ], ), ), 10.verticalSpace, Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [ Container( width: (MediaQuery.sizeOf(context).width - 40) / 2, decoration: BoxDecoration( color: AppStyle.blackColor, borderRadius: BorderRadius.circular(10.r), ), padding: REdgeInsets.all(16), child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text( AppHelpers.getTranslation(TrKeys.restaurantRevenue), style: AppStyle.interNormal( size: 12, color: AppStyle.white, letterSpacing: -0.3, ), ), Text( AppHelpers.numberFormat( state.countData?.totalPrice ?? 0, ), style: AppStyle.interSemi( size: 20, color: AppStyle.white, letterSpacing: -0.3, ), ), ], ), ), Container( width: (MediaQuery.sizeOf(context).width - 40) / 2, decoration: BoxDecoration( color: AppStyle.blackColor, borderRadius: BorderRadius.circular(10.r), ), padding: REdgeInsets.all(16), child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text( AppHelpers.getTranslation(TrKeys.fMRevenue), style: AppStyle.interNormal( size: 12, color: AppStyle.white, letterSpacing: -0.3, ), ), Text( AppHelpers.numberFormat( state.countData?.fmTotalPrice ?? 0, ), style: AppStyle.interSemi( size: 20, color: AppStyle.white, letterSpacing: -0.3, ), ), ], ), ), ], ), 10.verticalSpace, GestureDetector( onTap: ()`
*No documentation provided (generation failed).*
