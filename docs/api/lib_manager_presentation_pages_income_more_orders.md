# API Reference: more_orders

Source file: `lib/manager/presentation/pages/income/more_orders.dart`

## Classes

### class `MoreOrders`

## Whitelisted API Endpoints

### `MoreOrders({super.key, required this.endTime, required this.startTime}); @override ConsumerState<MoreOrders> createState() => _MoreOrdersState(); } class _MoreOrdersState extends ConsumerState<MoreOrders> { late RefreshController _refreshController; @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `ModalWrap(body: Padding( padding: EdgeInsets.symmetric(horizontal: 16.r), child: Column( mainAxisSize: MainAxisSize.min, children: [ const ModalDrag(), Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.end, children: [ Column( crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.end, children: [ Text( AppHelpers.getTranslation(TrKeys.moreOrders), style: AppStyle.interSemi(size: 18), ), Text( AppHelpers.getTranslation(TrKeys.moreOrders), style: AppStyle.interNormal( size: 14, letterSpacing: -0.3, ), ), ], ), InkWell( onTap: ()`
*No documentation provided (generation failed).*

### `BoxDecoration(color: AppStyle.white, shape: BoxShape.circle, ), child: const Icon( FlutterRemix.calendar_event_fill, color: AppStyle.black, ), ), ), ], ), 40.verticalSpace, Expanded( child: ref.watch(statisticsProvider).isLoading ? const Loading() : SmartRefresher( controller: _refreshController, physics: const BouncingScrollPhysics(), enablePullDown: true, enablePullUp: true, onLoading: ()`
*No documentation provided (generation failed).*
