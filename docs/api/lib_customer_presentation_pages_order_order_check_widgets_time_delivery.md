# API Reference: time_delivery

Source file: `lib/customer/presentation/pages/order/order_check/widgets/time_delivery.dart`

## Classes

### class `TimeDelivery`

## Whitelisted API Endpoints

### `TimeDelivery({super.key, required this.colors}); @override ConsumerState<TimeDelivery> createState() => _TimeDeliveryState(); } class _TimeDeliveryState extends ConsumerState<TimeDelivery> with TickerProviderStateMixin { late TimeNotifier event; late TimeState state; late OrderState stateOrder; late TabController _tabController; final _tabs = [ Tab(text: AppHelpers.getTranslation(TrKeys.today)), Tab(text: AppHelpers.getTranslation(TrKeys.tomorrow)), ]; Iterable list = []; bool? isCheckCloseDay(String? dateFormat)`
*No documentation provided (generation failed).*

### `initState()`
*No documentation provided (generation failed).*

### `didChangeDependencies()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Container(decoration: BoxDecoration( color: widget.colors.backgroundColor, borderRadius: BorderRadius.only( topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r), ), boxShadow: [ BoxShadow( color: AppStyle.black.withValues(alpha: 0.1), blurRadius: 20.r, offset: Offset(0, -5.h), spreadRadius: 0, ), ], ), width: double.infinity, child: Padding( padding: EdgeInsets.symmetric(horizontal: 20.w), child: Column( mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [ 12.verticalSpace, Center( child: Container( height: 5.h, width: 40.w, decoration: BoxDecoration( color: AppStyle.textGrey.withValues(alpha: 0.3), borderRadius: BorderRadius.all(Radius.circular(100.r)), ), ), ), 20.verticalSpace, TitleAndIcon( title: state.currentIndexOne == 0 ? AppHelpers.getTranslation(TrKeys.deliveryTime) : AppHelpers.getTranslation(TrKeys.timeSchedule), paddingHorizontalSize: 0, titleSize: 20, rightTitle: state.currentIndexOne == 0 ? "" : AppHelpers.getTranslation(TrKeys.clear), rightTitleColor: AppStyle.red, onRightTap: state.currentIndexOne == 0 ? ()`
*No documentation provided (generation failed).*

### `SelectItem(onTap: () => event.changeOne(index), isActive: state.currentIndexOne == index, title: list.elementAt(index), ); }, ) : Expanded( child: Column( children: [ CustomTabBar( isScrollable: true, tabController: _tabController, tabs: _tabs, ), Expanded( child: TabBarView( controller: _tabController, children: [ stateOrder.todayTimes.isNotEmpty ? ListView.builder( padding: EdgeInsets.only( top: 24.h, bottom: 16.h, ), itemCount: stateOrder.todayTimes.length, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `SelectItem(onTap: ()`
*No documentation provided (generation failed).*

### `SelectItem(onTap: ()`
*No documentation provided (generation failed).*
