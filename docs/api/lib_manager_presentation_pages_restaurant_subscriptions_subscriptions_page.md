# API Reference: subscriptions_page

Source file: `lib/manager/presentation/pages/restaurant/subscriptions/subscriptions_page.dart`

## Classes

### class `ManagerSubscriptionsPage`

## Whitelisted API Endpoints

### `ManagerSubscriptionsPage({super.key}); @override ConsumerState<ManagerSubscriptionsPage> createState() => _SubscriptionsPageState(); } class _SubscriptionsPageState extends ConsumerState<ManagerSubscriptionsPage> { late RefreshController refreshController; @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLrt ? TextDirection.ltr : TextDirection.rtl, child: Scaffold( body: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Column(mainAxisSize: MainAxisSize.min, children: [ CustomAppBar( bottomPadding: 12, height: 102, child: Row( children: [ IconButton( onPressed: () => context.maybePop(), icon: Icon(FlutterRemix.arrow_left_s_line), ), Text( AppHelpers.getTranslation(TrKeys.subscriptions), style: AppStyle.interNormal(size: 16), ), ], ), ), Expanded( child: SmartRefresher( controller: refreshController, onRefresh: () => notifier.fetchSubscriptions( context: context, controller: refreshController, isRefresh: true, ), child: state.isLoading ? LoadingGrid( verticalPadding: 12, itemBorderRadius: 12, horizontalPadding: 12, itemHeight: ((MediaQuery.sizeOf(context).height - 240.h) ~/ 2) - height, ) : SingleChildScrollView( padding: REdgeInsets.symmetric(vertical: 16), child: Column( children: [ if (LocalStorage.getShop()?.subscription != null) const HaveSubscription(), state.list.isEmpty ? NoDataInfo( title: AppHelpers.getTranslation( TrKeys.noData, ), ) : GridView.builder( shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), itemCount: state.list.length, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisSpacing: 8.r, mainAxisSpacing: 4.r, crossAxisCount: 2, mainAxisExtent: ((MediaQuery.sizeOf( context, ).height - 148.h) / 2) - height, ), padding: REdgeInsets.all(12), itemBuilder: (context, index) => SubscriptionsItem( subscription: state.list[index], purchase: ()`
*No documentation provided (generation failed).*
