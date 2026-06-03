# API Reference: on_a_way_orders_body

Source file: `lib/manager/presentation/pages/main/orders/widgets/on_a_way_orders_body.dart`

## Classes

### class `OnAWayOrdersBody`

## Whitelisted API Endpoints

### `OnAWayOrdersBody({super.key, this.scrollController}); @override State<OnAWayOrdersBody> createState() => _OnAWayOrdersBodyState(); } class _OnAWayOrdersBodyState extends State<OnAWayOrdersBody> { late RefreshController _refreshController; @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Consumer(builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `SmartRefresher(physics: const BouncingScrollPhysics(), controller: _refreshController, enablePullDown: true, enablePullUp: true, onLoading: () => event.fetchOnAWayOrders(refreshController: _refreshController), onRefresh: () => event.fetchOnAWayOrders( refreshController: _refreshController, isRefresh: true, ), child: state.isLoading ? const LoadingList(horizontalPadding: 16, verticalPadding: 16) : state.orders.isNotEmpty ? ListView.builder( padding: REdgeInsets.only( right: 16, left: 16, top: 16, bottom: 100, ), shrinkWrap: true, itemCount: state.orders.length, controller: widget.scrollController, physics: const BouncingScrollPhysics(), itemBuilder: (context, index)`
*No documentation provided (generation failed).*
