# API Reference: income_page

Source file: `lib/driver/presentation/pages/income/income_page.dart`

## Classes

### class `DriverIncomePage`

## Whitelisted API Endpoints

### `DriverIncomePage({super.key}); @override ConsumerState<DriverIncomePage> createState() => _IncomePageState(); } class _IncomePageState extends ConsumerState<DriverIncomePage> with SingleTickerProviderStateMixin { late TabController _tabController; final _tabs = [ Tab(child: Text(AppHelpers.getTranslation(TrKeys.today))), Tab(child: Text(AppHelpers.getTranslation(TrKeys.weekly))), Tab(child: Text(AppHelpers.getTranslation(TrKeys.monthly))), ]; @override void initState()`
*No documentation provided (generation failed).*

### `Duration(days: 7)), ); } else { ref .read(statisticsProvider.notifier) .fetchStatistics( startTime: DateTime.now(), endTime: DateTime.now().subtract(const Duration(days: 30)), ); } }); WidgetsBinding.instance.addPostFrameCallback((_)`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Scaffold(backgroundColor: AppStyle.textGrey, body: Column( children: [ const AbbBarScreen(), 16.verticalSpace, Expanded( child: SingleChildScrollView( padding: EdgeInsets.only( right: 16.w, left: 16.w, bottom: MediaQuery.paddingOf(context).bottom + 56.h, ), child: Column( children: [ CustomTabBar(tabController: _tabController, tabs: _tabs), 24.verticalSpace, _orderPrices(context, state), TitleAndIcon( title: AppHelpers.getTranslation( TrKeys.deliverymanTransactions, ), ), 12.verticalSpace, IncomeItem( title: AppHelpers.getTranslation(TrKeys.wallet), price: AppHelpers.numberFormat( number: LocalStorage.getUser()?.wallet?.price ?? 0, ), ), IncomeItem( title: AppHelpers.getTranslation(TrKeys.rating), price: "${LocalStorage.getUser()?.rate?.toStringAsFixed(1) ?? 0}", ), 24.verticalSpace, StatisticsScreen( totalOrders: (state.countData?.data?.totalCount ?? 0) .toString(), todayOrders: (state.countData?.data?.totalTodayCount ?? 0) .toString(), acceptedOrders: (state.countData?.data?.totalAcceptedCount ?? 0) .toString(), rejectedOrders: (state.countData?.data?.totalCanceledCount ?? 0) .toString(), doneOrders: (state.countData?.data?.totalDeliveredCount ?? 0) .toString(), canceledOrders: (state.countData?.data?.totalNewCount ?? 0) .toString(), acceptedPer: "${((state.countData?.data?.totalAcceptedCount ?? 0) / (state.countData?.data?.totalCount ?? 1) * 100).toStringAsFixed(1)}%", rejectedPer: "${((state.countData?.data?.totalCanceledCount ?? 0) / (state.countData?.data?.totalCount ?? 1) * 100).toStringAsFixed(1)}%", donePer: "${((state.countData?.data?.totalDeliveredCount ?? 0) / (state.countData?.data?.totalCount ?? 1) * 100).toStringAsFixed(1)}%", canceledPer: "${((state.countData?.data?.totalNewCount ?? 0) / (state.countData?.data?.totalCount ?? 1) * 100).toStringAsFixed(1)}%", ), 32.verticalSpace, _chart(state), ], ), ), ), ], ), floatingActionButtonLocation: FloatingActionButtonLocation.startFloat, floatingActionButton: const PopButton(), ); } Column _chart(StatisticsState state)`
*No documentation provided (generation failed).*

### `Column(children: [ TitleAndIcon(title: AppHelpers.getTranslation(TrKeys.earningsChart)), 16.verticalSpace, Container( width: double.infinity, height: 300.h, decoration: BoxDecoration( color: AppStyle.white, borderRadius: BorderRadius.circular(10.r), ), padding: EdgeInsets.all(16.r), child: BarChart( state.list, animate: true, vertical: false, animationDuration: const Duration(seconds: 1), defaultRenderer: BarRendererConfig( cornerStrategy: const ConstCornerStrategy(6), ), ), ), 32.verticalSpace, ], ); } Column _orderPrices(BuildContext context, StatisticsState state)`
*No documentation provided (generation failed).*
