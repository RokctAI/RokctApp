# API Reference: order_carts

Source file: `lib/customer/presentation/pages/order/order_screen/widgets/order_carts.dart`

## Classes

### class `OrderCarts`

## Whitelisted API Endpoints

### `OrderCarts({ super.key, required this.lat, required this.long, required this.tabBarIndex, required this.colors, }); @override State<OrderCarts> createState() => _OrderCartsState(); } class _OrderCartsState extends State<OrderCarts> { final _delayed = Delayed(milliseconds: 1200); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Consumer(builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `NeverScrollableScrollPhysics(), itemCount: stateCart?.userCarts?.length, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `Column(children: [ const Divider(), Theme( data: Theme.of( context, ).copyWith(dividerColor: AppStyle.transparent), child: ExpansionTile( title: TitleAndIcon( title: " ${stateCart?.userCarts?[index].name ?? ""} ${index == 0 ? "(${AppHelpers.getTranslation(TrKeys.owner)})" : ""}", ), children: [ ListView.builder( padding: EdgeInsets.symmetric( horizontal: 16.w, ), physics: const NeverScrollableScrollPhysics(), shrinkWrap: true, itemCount: stateCart ?.userCarts?[index] .cartDetails ?.length ?? 0, itemBuilder: (context, indexCart)`
*No documentation provided (generation failed).*

### `CartOrderItem(isAddComment: true, isOwn: index == 0, add: ()`
*No documentation provided (generation failed).*

### `NeverScrollableScrollPhysics(), shrinkWrap: true, itemCount: state.orderData?.details?.length ?? 0, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `CartOrderItem(isAddComment: true, isActive: false, add: ()`
*No documentation provided (generation failed).*

### `NeverScrollableScrollPhysics(), shrinkWrap: true, itemCount: stateCart?.userCarts?.first.cartDetails?.length ?? 0, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `CartOrderItem(isAddComment: true, add: ()`
*No documentation provided (generation failed).*

### `NeverScrollableScrollPhysics(), shrinkWrap: true, itemCount: ref.watch(orderProvider).orderData?.details?.length ?? 0, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `CartOrderItem(isAddComment: true, isActive: false, add: ()`
*No documentation provided (generation failed).*
