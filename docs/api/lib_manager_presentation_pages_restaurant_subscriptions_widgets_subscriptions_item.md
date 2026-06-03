# API Reference: subscriptions_item

Source file: `lib/manager/presentation/pages/restaurant/subscriptions/widgets/subscriptions_item.dart`

## Classes

### class `SubscriptionsItem`

## Whitelisted API Endpoints

### `SubscriptionsItem({ super.key, required this.subscription, required this.purchase, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Stack(children: [ Container( width: double.infinity, decoration: BoxDecoration( borderRadius: BorderRadius.circular(10.r), color: AppStyle.white, ), padding: REdgeInsets.symmetric(vertical: 32), margin: REdgeInsets.only(bottom: 8), child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [ Text( subscription.title ?? "", style: AppStyle.interNormal(size: 14), ), Text( AppHelpers.numberFormat(subscription.price), style: AppStyle.interSemi(size: 18), ), 12.verticalSpace, Text( "${subscription.month ?? 0} ${TrKeys.month}", style: AppStyle.interNormal(size: 14), ), Text( "${AppHelpers.getTranslation(TrKeys.product)}: ${subscription.productLimit ?? 0}", style: AppStyle.interNormal(size: 14), ), Text( "${AppHelpers.getTranslation(TrKeys.order)}: ${subscription.orderLimit ?? 0}", style: AppStyle.interNormal(size: 14), ), if (subscription.withReport ?? false) Text( "+ ${AppHelpers.getTranslation(TrKeys.withReport)}", style: AppStyle.interRegular(size: 12, color: AppStyle.green), ), 16.verticalSpace, SecondButton(title: TrKeys.purchase, onTap: purchase), ], ), ), Positioned( right: 8.r, top: 8.r, child: CircleButton( size: 30, iconSize: 16, icon: FlutterRemix.question_mark, onTap: ()`
*No documentation provided (generation failed).*
