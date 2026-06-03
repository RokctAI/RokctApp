# API Reference: home_page

Source file: `lib/customer/presentation/pages/home/home_page.dart`

## Classes

### class `HomePage`

## Whitelisted API Endpoints

### `HomePage({super.key}); @override ConsumerState<HomePage> createState() => _HomePageState(); } class _HomePageState extends ConsumerState<HomePage> { late HomeNotifier event; final RefreshController _bannerController = RefreshController(); final RefreshController _restaurantController = RefreshController(); final RefreshController _categoryController = RefreshController(); final RefreshController _storyController = RefreshController(); late ScrollController _controller; @override void initState()`
*No documentation provided (generation failed).*

### `didChangeDependencies()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `listen()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: CustomScaffold( body: (colors) => SmartRefresher( enablePullDown: true, enablePullUp: true, physics: const BouncingScrollPhysics(), controller: _restaurantController, scrollController: _controller, header: WaterDropMaterialHeader( distance: 160.h, backgroundColor: AppStyle.white, color: AppStyle.textGrey, ), onLoading: () => _onLoading(), onRefresh: () => _onRefresh(), child: SingleChildScrollView( child: Padding( padding: EdgeInsets.only(bottom: 56.h), child: Column( children: [ AppBarHome(state: state, event: event, colors: colors), 24.verticalSpace, CategoryScreen( state: state, event: event, categoryController: _categoryController, restaurantController: _restaurantController, ), state.selectIndexCategory == -1 ? _body(state, context) : FilterCategoryShop( colors: colors, state: state, event: event, shopController: _restaurantController, ), ], ), ), ), ), ), ); } Widget _body(HomeState state, BuildContext context)`
*No documentation provided (generation failed).*

### `Column(children: [ state.story?.isNotEmpty ?? false ? SizedBox( height: 200.r, child: SmartRefresher( controller: _storyController, scrollDirection: Axis.horizontal, enablePullDown: false, enablePullUp: true, onLoading: () async { await event.fetchStorePage(context, _storyController); }, child: AnimationLimiter( child: ListView.builder( shrinkWrap: true, scrollDirection: Axis.horizontal, itemCount: state.story?.length ?? 0, padding: EdgeInsets.only(left: 16.w), itemBuilder: (context, index) => AnimationConfiguration.staggeredList( position: index, duration: const Duration(milliseconds: 375), child: SlideAnimation( verticalOffset: 50.0, child: FadeInAnimation( child: ShopBarItem( index: index, controller: _storyController, story: state.story?[index]?.first, ), ), ), ), ), ), ), ) : const SizedBox.shrink(), 16.verticalSpace, state.isBannerLoading ? const BannerShimmer() : Container( height: state.banners.isNotEmpty ? 200.h : 0, margin: EdgeInsets.only( bottom: state.banners.isNotEmpty ? 30.h : 0, ), child: SmartRefresher( scrollDirection: Axis.horizontal, enablePullDown: false, enablePullUp: true, controller: _bannerController, onLoading: () async { await event.fetchBannerPage(context, _bannerController); }, child: AnimationLimiter( child: ListView.builder( shrinkWrap: true, scrollDirection: Axis.horizontal, itemCount: state.banners.length, padding: EdgeInsets.only(left: 16.w), itemBuilder: (context, index) => AnimationConfiguration.staggeredList( position: index, duration: const Duration(milliseconds: 375), child: SlideAnimation( verticalOffset: 50.0, child: FadeInAnimation( child: BannerItem(banner: state.banners[index]), ), ), ), ), ), ), ), 24.verticalSpace, state.isShopLoading ? ShopShimmer(title: AppHelpers.getTranslation(TrKeys.shops)) : state.shops.isNotEmpty ? Column( children: [ TitleAndIcon( rightTitle: AppHelpers.getTranslation(TrKeys.seeAll), isIcon: true, title: AppHelpers.getTranslation(TrKeys.favouriteBrand), onRightTap: ()`
*No documentation provided (generation failed).*

### `NeverScrollableScrollPhysics(), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( childAspectRatio: 1, crossAxisCount: 2, ), padding: EdgeInsets.symmetric(horizontal: 16.r), itemCount: state.shops.length, itemBuilder: (context, index) => AnimationConfiguration.staggeredGrid( position: index, duration: const Duration(milliseconds: 375), columnCount: state.shops.length, child: SlideAnimation( verticalOffset: 50.0, child: FadeInAnimation( child: MarketItem( isShop: true, shop: state.shops[index], ), ), ), ), ), ), 30.verticalSpace, ], ) : const SizedBox.shrink(), if (AppHelpers.getParcel()) const DoorToDoor(), if (state.ads.isNotEmpty) Column( children: [ TitleAndIcon(title: AppHelpers.getTranslation(TrKeys.newItem)), 12.verticalSpace, Container( height: state.ads.isNotEmpty ? 200.h : 0, margin: EdgeInsets.only( bottom: state.ads.isNotEmpty ? 30.h : 0, ), child: AnimationLimiter( child: ListView.builder( shrinkWrap: true, scrollDirection: Axis.horizontal, itemCount: state.ads.length, padding: EdgeInsets.only(left: 16.w), itemBuilder: (context, index) => AnimationConfiguration.staggeredList( position: index, duration: const Duration(milliseconds: 375), child: SlideAnimation( verticalOffset: 50.0, child: FadeInAnimation( child: BannerItem( isAds: true, banner: state.ads[index], ), ), ), ), ), ), ), ], ), 24.verticalSpace, state.isShopRecommendLoading ? const RecommendShopShimmer() : state.shopsRecommend.isNotEmpty ? Column( children: [ TitleAndIcon( rightTitle: AppHelpers.getTranslation(TrKeys.seeAll), isIcon: true, title: AppHelpers.getTranslation(TrKeys.recommended), onRightTap: ()`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 375), child: SlideAnimation( verticalOffset: 50.0, child: FadeInAnimation( child: RecommendedItem( shop: state.shopsRecommend[index], ), ), ), ), ), ), ), 30.verticalSpace, ], ) : const SizedBox.shrink(), state.isRestaurantNewLoading ? NewsShopShimmer( title: AppHelpers.getTranslation(TrKeys.newsOfWeek), ) : state.newRestaurant.isNotEmpty ? Column( children: [ TitleAndIcon( rightTitle: AppHelpers.getTranslation(TrKeys.seeAll), isIcon: true, title: AppHelpers.getTranslation(TrKeys.newsOfWeek), onRightTap: ()`
*No documentation provided (generation failed).*
