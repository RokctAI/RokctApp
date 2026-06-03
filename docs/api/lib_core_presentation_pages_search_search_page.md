# API Reference: search_page

Source file: `lib/core/presentation/pages/search/search_page.dart`

## Classes

### class `SearchPage`

## Whitelisted API Endpoints

### `SearchPage({super.key, this.isBackButton = true}); @override ConsumerState<SearchPage> createState() => _SearchPageState(); } class _SearchPageState extends ConsumerState<SearchPage> { late SearchNotifier event; late RefreshController _categoryController; late RefreshController _categoryControllerTwo; late RefreshController _productController; late ScrollController _controller; late TextEditingController _searchController; final _delayed = Delayed(milliseconds: 700); @override void initState()`
*No documentation provided (generation failed).*

### `didChangeDependencies()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `listen()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `KeyboardDismisser(child: CustomScaffold( body: (colors) => Column( children: [ CommonAppBar( isSearchPage: true, child: SearchTextField( isBorder: true, textEditingController: _searchController, onChanged: (s)`
*No documentation provided (generation failed).*

### `PopButton(), ) : const SizedBox.shrink(), ), ); } Widget _resultEmpty(CustomColorSet colors)`
*No documentation provided (generation failed).*

### `Column(children: [ Lottie.asset("assets/lottie/not-found.json", height: 200.h), Text( AppHelpers.getTranslation(TrKeys.nothingFound), style: AppStyle.interSemi(size: 18.sp, color: colors.textBlack), ), ], ); } Widget _searchResultBody( BuildContext context, SearchState state, CustomColorSet colors,)`
*No documentation provided (generation failed).*

### `SmartRefresher(scrollDirection: Axis.vertical, enablePullDown: false, enablePullUp: true, scrollController: _controller, controller: _productController, onLoading: () async { await event.searchProductPage(context, state.search); _productController.loadComplete(); }, child: ListView( shrinkWrap: true, padding: EdgeInsets.zero, children: [ 16.verticalSpace, ref.watch(homeProvider).isCategoryLoading ? const SearchCategoryShimmer() : ref.watch(homeProvider).categories.isNotEmpty ? Column( children: [ SizedBox( height: 36.h, child: SmartRefresher( scrollDirection: Axis.horizontal, enablePullDown: false, enablePullUp: true, controller: _categoryController, onLoading: () async { await ref .read(homeProvider.notifier) .fetchCategoriesPage( context, _categoryController, ); }, child: ListView.builder( shrinkWrap: true, scrollDirection: Axis.horizontal, itemCount: ref.watch(homeProvider).categories.length, padding: EdgeInsets.only(left: 16.w), itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `TabBarItem(isShopTabBar: true, title: ref .watch(homeProvider) .categories[index] .translation ?.title ?? "", currentIndex: state.selectIndexCategory, index: index, onTap: () => event.setSelectCategory( index, context, categoryId: state.selectIndexCategory >= 0 ? ref .watch(homeProvider) .categories[state.selectIndexCategory] .id : null, ), ); }, ), ), ), 30.verticalSpace, ], ) : const SizedBox.shrink(), state.isShopLoading ? const SearchShopShimmer() : Column( children: [ TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.restaurants), rightTitle: "${AppHelpers.getTranslation(TrKeys.found)} ${state.shops.length} ${AppHelpers.getTranslation(TrKeys.results)}", ), 20.verticalSpace, state.shops.isNotEmpty ? AnimationLimiter( child: ListView.builder( padding: EdgeInsets.symmetric(horizontal: 16.w), shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), itemCount: state.shops.length, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 375), child: SlideAnimation( horizontalOffset: 50.0, child: FadeInAnimation( child: RestaurantItem( colors: colors, shop: state.shops[index], ), ), ), ); }, ), ) : _resultEmpty(colors), ], ), 22.verticalSpace, state.isProductLoading ? const SearchProductShimmer() : Column( children: [ TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.products), rightTitle: "${AppHelpers.getTranslation(TrKeys.found)} ${state.products.length} ${AppHelpers.getTranslation(TrKeys.results)}", ), 20.verticalSpace, state.products.isNotEmpty ? AnimationLimiter( child: ListView.builder( padding: EdgeInsets.only( right: 16.w, left: 16.w, bottom: MediaQuery.paddingOf(context).bottom, ), shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), itemCount: state.products.length, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 375), child: SlideAnimation( horizontalOffset: 50.0, child: FadeInAnimation( child: ProductItem( colors: colors, product: state.products[index], ), ), ), ); }, ), ) : _resultEmpty(colors), ], ), ], ), ); } Widget _categoryAndSearchHistory( SearchState state, BuildContext context, CustomColorSet colors,)`
*No documentation provided (generation failed).*

### `ListView(shrinkWrap: true, controller: _controller, padding: EdgeInsets.only(bottom: 100.h), children: [ 16.verticalSpace, ref.watch(homeProvider).isCategoryLoading ? const SearchCategoryShimmer() : ref.watch(homeProvider).categories.isNotEmpty ? Column( children: [ SizedBox( height: 36.h, child: SmartRefresher( scrollDirection: Axis.horizontal, enablePullDown: false, enablePullUp: true, controller: _categoryControllerTwo, onLoading: () async { await ref .read(homeProvider.notifier) .fetchCategoriesPage( context, _categoryControllerTwo, ); }, child: AnimationLimiter( child: ListView.builder( shrinkWrap: true, scrollDirection: Axis.horizontal, itemCount: ref.watch(homeProvider).categories.length, padding: EdgeInsets.only(left: 16.w), itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 375), child: SlideAnimation( verticalOffset: 50.0, child: FadeInAnimation( child: TabBarItem( isShopTabBar: true, title: ref .watch(homeProvider) .categories[index] .translation ?.title ?? "", index: index, currentIndex: state.selectIndexCategory, onTap: () => event.setSelectCategory( index, context, categoryId: state.selectIndexCategory >= 0 ? ref .watch(homeProvider) .categories[state .selectIndexCategory] .id : null, ), ), ), ), ); }, ), ), ), ), 30.verticalSpace, ], ) : const SizedBox.shrink(), TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.recently), rightTitle: AppHelpers.getTranslation(TrKeys.clear), rightTitleColor: AppStyle.red, onRightTap: ()`
*No documentation provided (generation failed).*

### `NeverScrollableScrollPhysics(), itemCount: state.searchHistory.length, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 375), child: SlideAnimation( horizontalOffset: 50.0, child: FadeInAnimation( child: SearchResultText( colors: colors, title: state.searchHistory[index], canceled: ()`
*No documentation provided (generation failed).*
