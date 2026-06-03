# API Reference: order_type

Source file: `lib/customer/presentation/pages/order/order_type/order_type.dart`

## Classes

### class `OrderType`

## Whitelisted API Endpoints

### `OrderType({ super.key, required this.onChange, required this.getLocation, required this.tabController, required this.shopId, required this.sendUser, required this.colors, }); @override State<OrderType> createState() => _OrderPageState(); } class _OrderPageState extends State<OrderType> { final _tabs = [ Tab(text: AppHelpers.getTranslation(TrKeys.delivery)), Tab(text: AppHelpers.getTranslation(TrKeys.pickup)), ]; CustomColorSet get colors => widget.colors; @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*
