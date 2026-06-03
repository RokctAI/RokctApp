# API Reference: result_filter

Source file: `lib/customer/presentation/pages/home/filter/result_filter.dart`

## Classes

### class `ResultFilterPage`

## Whitelisted API Endpoints

### `ResultFilterPage({super.key, required this.categoryId}); @override ConsumerState<ResultFilterPage> createState() => _ResultFilterState(); } class _ResultFilterState extends ConsumerState<ResultFilterPage> { late FilterNotifier event; final RefreshController _shopController = RefreshController(); final RefreshController _restaurantController = RefreshController(); @override void initState()`
*No documentation provided (generation failed).*

### `didChangeDependencies()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Scaffold(body: Column( children: [ CommonAppBar( child: Text( AppHelpers.getTranslation(TrKeys.shops), style: AppStyle.interNoSemi(size: 18.sp), ), ), Expanded( child: SmartRefresher( controller: _restaurantController, enablePullUp: true, enablePullDown: true, onLoading: ()`
*No documentation provided (generation failed).*
