# API Reference: orders_home_page

Source file: `lib/manager/presentation/pages/main/orders/orders_home_page.dart`

## Classes

### class `OrdersHomePage`

## Whitelisted API Endpoints

### `OrdersHomePage({super.key}); @override ConsumerState<OrdersHomePage> createState() => _OrdersHomePageState(); } class _OrdersHomePageState extends ConsumerState<OrdersHomePage> with SingleTickerProviderStateMixin { TabController? _tabController; ScrollController? _newController; ScrollController? _acceptedController; ScrollController? _readyController; ScrollController? _onAWayController; ScrollController? _cookingController; final _tabs = [ Tab(child: Icon(FlutterRemix.fire_fill, size: 22.r)), Tab(child: Icon(FlutterRemix.check_double_fill, size: 22.r)), Tab(child: Icon(FlutterRemix.restaurant_fill, size: 22.r)), Tab(child: Icon(FlutterRemix.time_fill, size: 22.r)), Tab(child: Icon(FlutterRemix.takeaway_fill, size: 22.r)), ]; @override void initState()`
*No documentation provided (generation failed).*

### `listen(_newController)); _acceptedController?.addListener(() => listen(_acceptedController)); _cookingController?.addListener(() => listen(_cookingController)); _readyController?.addListener(() => listen(_readyController)); _onAWayController?.addListener(() => listen(_onAWayController)); WidgetsBinding.instance.addPostFrameCallback((_)`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `listen(_newController)); _acceptedController?.removeListener(() => listen(_acceptedController)); _cookingController?.removeListener(() => listen(_cookingController)); _readyController?.removeListener(() => listen(_readyController)); _onAWayController?.removeListener(() => listen(_onAWayController)); _newController?.dispose(); _acceptedController?.dispose(); _cookingController?.dispose(); _readyController?.dispose(); _onAWayController?.dispose(); } void listen(ScrollController? controller)`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: Scaffold( backgroundColor: AppStyle.textGrey, body: Column( children: [ CustomAppBar( bottomPadding: 16.r, child: GestureDetector( onTap: ()`
*No documentation provided (generation failed).*

### `BoxDecoration(shape: BoxShape.circle, color: AppStyle.textGrey, ), padding: REdgeInsets.all(12), child: Icon( FlutterRemix.dashboard_3_line, size: 20.r, color: AppStyle.blackColor, ), ), 10.horizontalSpace, Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*
