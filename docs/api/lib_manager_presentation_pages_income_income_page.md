# API Reference: income_page

Source file: `lib/manager/presentation/pages/income/income_page.dart`

## Classes

### class `ManagerIncomePage`

## Whitelisted API Endpoints

### `ManagerIncomePage({super.key}); @override ConsumerState<ManagerIncomePage> createState() => _IncomePageState(); } class _IncomePageState extends ConsumerState<ManagerIncomePage> with SingleTickerProviderStateMixin { late TabController _tabController; final _tabs = [ Tab(child: Text(AppHelpers.getTranslation(TrKeys.today))), Tab(child: Text(AppHelpers.getTranslation(TrKeys.weekly))), Tab(child: Text(AppHelpers.getTranslation(TrKeys.monthly))), ]; @override void initState()`
*No documentation provided (generation failed).*

### `Duration(days: 7)), ); } else { ref .read(statisticsProvider.notifier) .fetchStatistics( startTime: DateTime.now(), endTime: DateTime.now().subtract(const Duration(days: 30)), ); } }); WidgetsBinding.instance.addPostFrameCallback((_)`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Scaffold(backgroundColor: AppStyle.textGrey, body: Column( children: [ AppbarScreen(event: ref.read(statisticsProvider.notifier)), 16.verticalSpace, Expanded( child: SingleChildScrollView( physics: const BouncingScrollPhysics(), padding: EdgeInsets.only( right: 16.w, left: 16.w, bottom: MediaQuery.of(context).padding.bottom + 56.h, ), child: Column( children: [ CustomTabBar(tabController: _tabController, tabs: _tabs), 24.verticalSpace, OrderPricesSection( startTime: DateTime.now(), endTime: DateTime.now().subtract( Duration( days: _tabController.index == 0 ? 0 : _tabController.index == 1 ? 7 : 30, ), ), ), if (ref .watch(statisticsProvider) .countData ?.chart ?.isNotEmpty ?? false) _chart(), const StatisticsSection(), 20.verticalSpace, ], ), ), ), ], ), floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked, floatingActionButton: Padding( padding: REdgeInsets.all(16), child: const Row( crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [PopButton(heroTag: AppConstants.heroTagIncomePage)], ), ), ); } Column _chart()`
*No documentation provided (generation failed).*
