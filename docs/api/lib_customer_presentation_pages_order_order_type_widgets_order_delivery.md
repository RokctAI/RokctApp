# API Reference: order_delivery

Source file: `lib/customer/presentation/pages/order/order_type/widgets/order_delivery.dart`

## Classes

### class `OrderDelivery`

## Whitelisted API Endpoints

### `OrderDelivery({ super.key, required this.onChange, required this.getLocation, required this.shopId, required this.colors, }); @override State<OrderDelivery> createState() => _OrderDeliveryState(); } class _OrderDeliveryState extends State<OrderDelivery> { late TextEditingController houseController; late TextEditingController floorController; late TextEditingController commentController; late TextEditingController nameController; late TextEditingController phoneController; late TextEditingController userPhoneNumber; @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Padding(padding: EdgeInsets.only(top: 24.h), child: SingleChildScrollView( physics: const NeverScrollableScrollPhysics(), child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Column(children: [ OrderContainer( colors: widget.colors, onTap: () async { AppHelpers.showCustomModalBottomSheet( context: context, modal: SelectAddressScreen( addAddress: () async { await context.pushRoute( ViewMapRoute(shopId: widget.shopId), ); widget.getLocation(); }, ), isDarkMode: false, ); }, icon: Padding( padding: EdgeInsets.only(left: 4.w), child: SvgPicture.asset( Assets.svgAddress, colorFilter: ColorFilter.mode( widget.colors.textBlack, BlendMode.srcIn, ), width: 20.r, height: 20.r, ), ), title: AppHelpers.getTranslation(TrKeys.deliveryAddress), description: (LocalStorage.getAddressSelected()?.title?.isEmpty ?? true) ? LocalStorage.getAddressSelected()?.address ?? '' : LocalStorage.getAddressSelected()?.title ?? "", ), 10.verticalSpace, OrderContainer( colors: widget.colors, onTap: ()`
*No documentation provided (generation failed).*
