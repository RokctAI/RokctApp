# API Reference: home_two_page

Source file: `lib/customer/presentation/pages/home/home_two/home_two_page.dart`

## Classes

### class `HomeTwoPage`

## Whitelisted API Endpoints

### `HomeTwoPage({super.key}); @override ConsumerState<HomeTwoPage> createState() => _HomeTwoPageState(); } class _HomeTwoPageState extends ConsumerState<HomeTwoPage> { late HomeNotifier event; final RefreshController _bannerController = RefreshController(); final RefreshController _restaurantController = RefreshController(); final RefreshController _categoryController = RefreshController(); final RefreshController _storyController = RefreshController(); @override void initState()`
*No documentation provided (generation failed).*

### `didChangeDependencies()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `Directionality(textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: CustomScaffold( body: (colors) => Column( children: [ AppBarTwo(state: state, event: event, colors: colors), Expanded( child: SmartRefresher( enablePullDown: true, enablePullUp: true, physics: const BouncingScrollPhysics(), controller: _restaurantController, header: WaterDropMaterialHeader( distance: 160.h, backgroundColor: AppStyle.white, color: AppStyle.textGrey, ), onLoading: () => _onLoading(), onRefresh: () => _onRefresh(), child: ListView( shrinkWrap: true, padding: EdgeInsets.only(top: 4.r), children: [ CategoryTwo( state: state, event: event, categoryController: _categoryController, onTap: ()`
*No documentation provided (generation failed).*

### `Column(children: [ state.isRestaurantLoading ? const AllShopTwoShimmer() : Column( children: [ TitleAndIcon( rightTitle: AppHelpers.getTranslation(TrKeys.seeAll), isIcon: true, title: AppHelpers.getTranslation(TrKeys.popular), onRightTap: ()`
*No documentation provided (generation failed).*

### `SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75, ), padding: EdgeInsets.symmetric(horizontal: 8.r), shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), scrollDirection: Axis.vertical, itemCount: state.restaurant.length > 6 ? 6 : state.restaurant.length, itemBuilder: (context, index) => AnimationConfiguration.staggeredList( position: index, duration: const Duration(milliseconds: 375), child: SlideAnimation( verticalOffset: 50.0, child: FadeInAnimation( child: MarketTwoItem( shop: state.restaurant[index], isSimpleShop: true, ), ), ), ), ), ) : SvgPicture.asset(Assets.svgEmpty, height: 100.h), ], ), Container( margin: REdgeInsets.symmetric(vertical: 16), decoration: BoxDecoration( color: colors.backgroundColor, borderRadius: BorderRadius.circular(6.r), ), child: Column( children: [ state.isBannerLoading ? const BannerTwoShimmer() : Column( children: [ 12.verticalSpace, TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.banner), ), SizedBox( height: state.banners.isNotEmpty ? 220.h : 0, width: double.infinity, child: SmartRefresher( scrollDirection: Axis.horizontal, controller: _bannerController, enablePullDown: false, enablePullUp: true, onLoading: () async { await event.fetchBannerPage( context, _bannerController, ); }, child: AnimationLimiter( child: ListView.builder( scrollDirection: Axis.horizontal, shrinkWrap: true, itemCount: state.banners.length, padding: REdgeInsets.symmetric( horizontal: 16, vertical: 12, ), itemBuilder: (context, index) => AnimationConfiguration.staggeredList( position: index, duration: const Duration( milliseconds: 375, ), child: SlideAnimation( verticalOffset: 50.0, child: FadeInAnimation( child: BannerTwoItem( banner: state.banners[index], ), ), ), ), ), ), ), ), 16.verticalSpace, ], ), DeliveryBanner(colors: colors), state.isShopLoading ? ShopShimmer(title: AppHelpers.getTranslation(TrKeys.shops)) : state.shops.isNotEmpty ? Column( children: [ TitleAndIcon( rightTitle: AppHelpers.getTranslation(TrKeys.seeAll), isIcon: true, title: AppHelpers.getTranslation( TrKeys.favouriteBrand, ), onRightTap: ()`
*No documentation provided (generation failed).*

### `NeverScrollableScrollPhysics(), shrinkWrap: true, itemCount: state.shops.length > 6 ? 6 : state.shops.length, itemBuilder: (context, index) => AnimationConfiguration.staggeredList( position: index, duration: const Duration(milliseconds: 375), child: SlideAnimation( verticalOffset: 50.0, child: FadeInAnimation( child: MarketTwoItem( isShop: true, shop: state.shops[index], ), ), ), ), ), ), 24.verticalSpace, ], ) : const SizedBox.shrink(), Container( height: state.ads.isNotEmpty ? 200.h : 0, margin: EdgeInsets.only( bottom: state.ads.isNotEmpty ? 30.h : 0, ), child: AnimationLimiter( child: ListView.builder( shrinkWrap: true, scrollDirection: Axis.horizontal, itemCount: state.ads.length, padding: EdgeInsets.only(left: 16.w), itemBuilder: (context, index) => AnimationConfiguration.staggeredList( position: index, duration: const Duration(milliseconds: 375), child: SlideAnimation( verticalOffset: 50.0, child: FadeInAnimation( child: BannerItem( isAds: true, banner: state.ads[index], ), ), ), ), ), ), ), ], ), ), state.isShopRecommendLoading ? const RecommendShopShimmer() : state.shopsRecommend.isNotEmpty ? Column( children: [ TitleAndIcon( rightTitle: AppHelpers.getTranslation(TrKeys.seeAll), isIcon: true, title: AppHelpers.getTranslation(TrKeys.recommended), onRightTap: ()`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 375), child: SlideAnimation( verticalOffset: 50, child: FadeInAnimation( child: RecommendedTwoItem( shop: state.shopsRecommend[index], ), ), ), ), ), ), ), 30.verticalSpace, ], ) : const SizedBox.shrink(), state.story?.isNotEmpty ?? false ? Padding( padding: EdgeInsets.only(bottom: 16.r), child: SizedBox( height: 210.r, child: SmartRefresher( controller: _storyController, scrollDirection: Axis.horizontal, enablePullDown: false, enablePullUp: true, onLoading: () async { await event.fetchStorePage(context, _storyController); }, child: AnimationLimiter( child: ListView.builder( shrinkWrap: true, scrollDirection: Axis.horizontal, itemCount: state.story?.length ?? 0, padding: EdgeInsets.only(left: 16.w), itemBuilder: (context, index) => AnimationConfiguration.staggeredList( position: index, duration: const Duration(milliseconds: 375), child: SlideAnimation( verticalOffset: 50.0, child: FadeInAnimation( child: ShopBarItem( index: index, controller: _storyController, story: state.story?[index]?.first, ), ), ), ), ), ), ), ), ) : const SizedBox.shrink(), state.isRestaurantNewLoading ? NewsShopShimmer( title: AppHelpers.getTranslation(TrKeys.newsOfWeek), ) : state.newRestaurant.isNotEmpty ? Column( children: [ TitleAndIcon( rightTitle: AppHelpers.getTranslation(TrKeys.seeAll), isIcon: true, title: AppHelpers.getTranslation(TrKeys.newsOfWeek), onRightTap: ()`
*No documentation provided (generation failed).*
