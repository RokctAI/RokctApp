# API Reference: home_one_page

Source file: `lib/customer/presentation/pages/home/home_one/home_one_page.dart`

## Classes

### class `HomeOnePage`

## Whitelisted API Endpoints

### `HomeOnePage({super.key}); @override ConsumerState<HomeOnePage> createState() => _HomeOnePageState(); } class _HomeOnePageState extends ConsumerState<HomeOnePage> { late HomeNotifier event; final RefreshController _bannerController = RefreshController(); final RefreshController _restaurantController = RefreshController(); final RefreshController _storyController = RefreshController(); final RefreshController _categoryController = RefreshController(); @override void initState()`
*No documentation provided (generation failed).*

### `didChangeDependencies()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: CustomScaffold( body: (colors) => Column( children: [ AppBarOne(state: state, event: event, colors: colors), Expanded( child: SmartRefresher( enablePullDown: true, enablePullUp: true, physics: const BouncingScrollPhysics(), controller: _restaurantController, header: WaterDropMaterialHeader( distance: 160.h, backgroundColor: AppStyle.white, color: AppStyle.textGrey, ), onLoading: () => _onLoading(), onRefresh: () => _onRefresh(), child: ListView( shrinkWrap: true, padding: EdgeInsets.only(top: 24.r), children: [ CategoryOne( colors: colors, state: state, event: event, categoryController: _categoryController, restaurantController: _restaurantController, ), state.selectIndexCategory == -1 ? _body(state, context) : FilterCategoryOneShop( colors: colors, state: state, event: event, shopController: _restaurantController, ), ], ), ), ), ], ), ), ); } Widget _body(HomeState state, BuildContext context)`
*No documentation provided (generation failed).*

### `Column(children: [ state.isBannerLoading ? const BannerOneShimmer() : Column( children: [ Container( height: state.banners.isNotEmpty ? 150.h : 0, margin: EdgeInsets.only( bottom: state.banners.isNotEmpty ? 30.h : 0, ), child: SmartRefresher( scrollDirection: Axis.horizontal, enablePullDown: false, enablePullUp: true, controller: _bannerController, onLoading: () async { await event.fetchBannerPage(context, _bannerController); }, child: AnimationLimiter( child: ListView.builder( shrinkWrap: true, scrollDirection: Axis.horizontal, itemCount: state.banners.length, padding: EdgeInsets.only(left: 16.w), itemBuilder: (context, index) => AnimationConfiguration.staggeredList( position: index, duration: const Duration(milliseconds: 375), child: SlideAnimation( verticalOffset: 50.0, child: FadeInAnimation( child: BannerOneItem( banner: state.banners[index], ), ), ), ), ), ), ), ), ], ), state.shops.isNotEmpty ? Column( children: [ TitleAndIcon( rightTitle: AppHelpers.getTranslation(TrKeys.seeAll), isIcon: true, title: AppHelpers.getTranslation(TrKeys.favouriteBrand), onRightTap: ()`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 375), child: SlideAnimation( verticalOffset: 50.0, child: FadeInAnimation( child: MarketOneItem( isShop: true, shop: state.shops[index], ), ), ), ), ), ), ), 16.verticalSpace, ], ) : const SizedBox.shrink(), state.story?.isNotEmpty ?? false ? Column( children: [ TitleAndIcon( isIcon: false, title: AppHelpers.getTranslation(TrKeys.stories), ), 12.verticalSpace, SizedBox( height: 160.r, child: SmartRefresher( controller: _storyController, scrollDirection: Axis.horizontal, enablePullDown: false, enablePullUp: true, onLoading: () async { await event.fetchStorePage(context, _storyController); }, child: AnimationLimiter( child: ListView.builder( shrinkWrap: true, scrollDirection: Axis.horizontal, itemCount: state.story?.length ?? 0, padding: EdgeInsets.only(left: 16.w), itemBuilder: (context, index) => AnimationConfiguration.staggeredList( position: index, duration: const Duration(milliseconds: 375), child: SlideAnimation( verticalOffset: 50.0, child: FadeInAnimation( child: ShopBarOneItem( index: index, controller: _storyController, story: state.story?[index]?.first, ), ), ), ), ), ), ), ), ], ) : const SizedBox.shrink(), if (AppHelpers.getParcel()) const DoorToDoor(), state.isShopRecommendLoading ? const RecommendShopShimmer() : state.shopsRecommend.isNotEmpty ? Column( children: [ TitleAndIcon( rightTitle: AppHelpers.getTranslation(TrKeys.seeAll), isIcon: true, title: AppHelpers.getTranslation(TrKeys.popularNearYou), onRightTap: ()`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 375), child: SlideAnimation( verticalOffset: 50.0, child: FadeInAnimation( child: RecommendedOneItem( shop: state.shopsRecommend[index], ), ), ), ), ), ), ), 30.verticalSpace, ], ) : const SizedBox.shrink(), state.isRestaurantNewLoading ? NewsShopShimmer( title: AppHelpers.getTranslation(TrKeys.newsOfWeek), ) : state.newRestaurant.isNotEmpty ? Column( children: [ TitleAndIcon( rightTitle: AppHelpers.getTranslation(TrKeys.seeAll), isIcon: true, title: AppHelpers.getTranslation(TrKeys.newsOfWeek), onRightTap: ()`
*No documentation provided (generation failed).*
