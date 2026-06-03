# API Reference: create_order_page

Source file: `lib/manager/presentation/pages/main/create_order/create_order_page.dart`

## Classes

### class `ManagerCreateOrderPage`

## Whitelisted API Endpoints

### `ManagerCreateOrderPage({super.key}); @override ConsumerState<ManagerCreateOrderPage> createState() => _CreateOrderPageState(); } class _CreateOrderPageState extends ConsumerState<ManagerCreateOrderPage> { late RefreshController _categoryController; late RefreshController _productController; @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: KeyboardDisable( child: Scaffold( resizeToAvoidBottomInset: false, backgroundColor: AppStyle.textGrey, body: Column( children: [ CustomAppBar( bottomPadding: 4.h, child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `SearchTextField(onChanged: (value) => productsEvent.setQuery( query: value, categoryId: categoriesState.activeIndex == 1 ? null : categoriesState .categories[categoriesState.activeIndex - 2] .id, cartStocks: ref.watch(orderCartProvider).stocks, ), suffixIcon: Icon( FlutterRemix.equalizer_fill, color: AppStyle.blackColor, size: 20.r, ), ); }, ), ), Expanded( child: Column( children: [ 24.verticalSpace, Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Padding(padding: REdgeInsets.symmetric(horizontal: 16), child: Row( children: [ Expanded( child: GestureDetector( onTap: ()`
*No documentation provided (generation failed).*

### `TabBarLoading() : SizedBox( height: 36.h, child: CategoriesTabBar( categories: currentCategories, activeIndex: currentActiveIndex, refreshController: _categoryController, onChangeTab: (index)`
*No documentation provided (generation failed).*

### `ProductsBody(loadingHeight: 130, isOrderFoods: true, isLoading: productsState.isLoading, products: productsState.products, refreshController: _productController, onRefreshing: () => productsEvent.fetchProducts( cartStocks: ref.watch(orderCartProvider).stocks, refreshController: _productController, isRefresh: true, categoryId: categoriesState.activeIndex == 1 ? null : categoriesState .categories[categoriesState .activeIndex - 2] .id, ), onLoading: () => productsEvent.fetchProducts( refreshController: _productController, cartStocks: ref.watch(orderCartProvider).stocks, categoryId: categoriesState.activeIndex == 1 ? null : categoriesState .categories[categoriesState .activeIndex - 2] .id, ), onProductTap: (index) => AppHelpers.showCustomModalBottomDragSheet( paddingTop: 60, context: context, maxChildSize: 0.8, initSize: 0.6, modal: (c) => FoodDetailsModal( controller: c, product: productsState.products[index], ), ), ); }, ), ), ], ), ), ], ), floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked, floatingActionButton: Padding( padding: REdgeInsets.all(16), child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[ const PopButton(heroTag: AppConstants.heroTagAddOrderButton), Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*
