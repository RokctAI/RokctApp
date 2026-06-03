# API Reference: home_page_three

Source file: `lib/customer/presentation/pages/home/home_three/home_page_three.dart`

## Classes

### class `HomePageThree`

## Whitelisted API Endpoints

### `HomePageThree({super.key}); @override ConsumerState<HomePageThree> createState() => _HomePageState(); } class _HomePageState extends ConsumerState<HomePageThree> { late HomeNotifier event; final RefreshController _bannerController = RefreshController(); final RefreshController _restaurantController = RefreshController(); final RefreshController _categoryController = RefreshController(); final RefreshController _storyController = RefreshController(); final PageController _pageController = PageController(); @override void initState()`
*No documentation provided (generation failed).*

### `didChangeDependencies()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: ThemeWrapper( builder: (colors, theme)`
*No documentation provided (generation failed).*

### `Scaffold(backgroundColor: colors.backgroundColor, body: SmartRefresher( enablePullDown: true, enablePullUp: true, physics: const BouncingScrollPhysics(), controller: _restaurantController, header: WaterDropMaterialHeader( distance: 160.h, backgroundColor: AppStyle.white, color: AppStyle.textGrey, ), onLoading: () => _onLoading(), onRefresh: () => _onRefresh(), child: ListView( shrinkWrap: true, padding: EdgeInsets.only(bottom: 120.r), children: [ AppBarThree(state: state, event: event, colors: colors), 12.verticalSpace, Padding( padding: REdgeInsets.symmetric(horizontal: 12), child: SearchTextField( isRead: true, isBorder: true, onTap: ()`
*No documentation provided (generation failed).*

### `Icon(FlutterRemix.equalizer_fill, color: AppStyle.black, ), ), ), 12.verticalSpace, state.isBannerLoading ? const BannerShimmer() : BannerThree( bannerController: _bannerController, pageController: _pageController, banners: state.banners, notifier: event, ), CategoryScreenThree( colors: colors, state: state, categoryController: _categoryController, event: event, restaurantController: _restaurantController, ), state.selectIndexCategory == -1 ? _body(state, event, context, colors) : FilterCategoryShopThree( colors: colors, state: state, event: event, shopController: _restaurantController, ), ], ), ), ); }, ), ); } Widget _body( HomeState state, HomeNotifier event, BuildContext context, CustomColorSet colors,)`
*No documentation provided (generation failed).*

### `Column(children: [ state.isShopLoading ? ShopShimmerThree( title: AppHelpers.getTranslation(TrKeys.chooseBrand), ) : state.shops.isNotEmpty ? Column( children: [ Text( AppHelpers.getTranslation(TrKeys.chooseBrand), style: AppStyle.interNoSemi(color: colors.textBlack), ), AnimationLimiter( child: GridView.builder( gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 3, mainAxisSpacing: 8.r, crossAxisSpacing: 8.r, mainAxisExtent: 168.r, ), padding: EdgeInsets.symmetric( horizontal: 16.r, vertical: 16, ), physics: const NeverScrollableScrollPhysics(), shrinkWrap: true, itemCount: state.shops.length > 5 ? 6 : state.shops.length, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 375), child: SlideAnimation( verticalOffset: 50.0, child: FadeInAnimation( child: index == 5 ? ShopSeeAll( brandCount: state.totalShops, colors: colors, ) : MarketThreeItem( isShop: true, shop: state.shops[index], ), ), ), ); }, ), ), ], ) : const SizedBox.shrink(), if (AppHelpers.getParcel()) const DoorThree(), state.story?.isNotEmpty ?? false ? SizedBox( height: 224.r, child: SmartRefresher( controller: _storyController, scrollDirection: Axis.horizontal, enablePullDown: false, enablePullUp: true, onLoading: () async { await event.fetchStorePage(context, _storyController); }, child: AnimationLimiter( child: ListView.builder( shrinkWrap: true, scrollDirection: Axis.horizontal, itemCount: state.story?.length ?? 0, padding: EdgeInsets.only(left: 16.w), itemBuilder: (context, index) => AnimationConfiguration.staggeredList( position: index, duration: const Duration(milliseconds: 375), child: SlideAnimation( verticalOffset: 50.0, child: FadeInAnimation( child: ShopBarItemThree( index: index, controller: _storyController, story: state.story?[index]?.first, ), ), ), ), ), ), ), ) : const SizedBox.shrink(), 16.verticalSpace, state.isRestaurantNewLoading ? NewsShopShimmer( title: AppHelpers.getTranslation(TrKeys.newsOfWeek), ) : state.newRestaurant.isNotEmpty ? Column( children: [ TitleAndIcon( rightTitle: AppHelpers.getTranslation(TrKeys.seeAll), isIcon: true, title: AppHelpers.getTranslation(TrKeys.newsOfWeek), onRightTap: ()`
*No documentation provided (generation failed).*

### `NeverScrollableScrollPhysics(), shrinkWrap: true, itemCount: state.newRestaurant.length, itemBuilder: (context, index) => AnimationConfiguration.staggeredList( position: index, duration: const Duration(milliseconds: 375), child: SlideAnimation( verticalOffset: 50.0, child: FadeInAnimation( child: MarketThreeItem( shop: state.newRestaurant[index], isSimpleShop: true, ), ), ), ), ), ), ], ) : const SizedBox.shrink(), 24.verticalSpace, state.isShopRecommendLoading ? const RecommendShopShimmer() : state.shopsRecommend.isNotEmpty ? Column( children: [ TitleAndIcon( rightTitle: AppHelpers.getTranslation(TrKeys.seeAll), isIcon: true, title: AppHelpers.getTranslation(TrKeys.recommended), onRightTap: ()`
*No documentation provided (generation failed).*
