# API Reference: like_page

Source file: `lib/customer/presentation/pages/like/like_page.dart`

## Classes

### class `LikePage`

## Whitelisted API Endpoints

### `LikePage({super.key, this.isBackButton = true}); @override ConsumerState<LikePage> createState() => _LikePageState(); } class _LikePageState extends ConsumerState<LikePage> { late LikeNotifier event; final RefreshController _bannerController = RefreshController(); final RefreshController _likeShopController = RefreshController(); final ScrollController _controller = ScrollController(); @override void initState()`
*No documentation provided (generation failed).*

### `didChangeDependencies()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `listen()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `CustomScaffold(body: (colors) => Column( children: [ CommonAppBar( child: Text( AppHelpers.getTranslation(TrKeys.likeRestaurants), style: AppStyle.interNoSemi(size: 18, color: colors.textBlack), ), ), Expanded( child: SmartRefresher( enablePullDown: true, enablePullUp: false, physics: const BouncingScrollPhysics(), controller: _likeShopController, scrollController: _controller, onLoading: ()`
*No documentation provided (generation failed).*

### `BannerShimmer() : SizedBox( height: 200.h, child: SmartRefresher( scrollDirection: Axis.horizontal, enablePullDown: false, enablePullUp: true, controller: _bannerController, onLoading: () async { await ref .read(homeProvider.notifier) .fetchBannerPage( context, _bannerController, ); }, child: ListView.builder( shrinkWrap: false, scrollDirection: Axis.horizontal, itemCount: ref .watch(homeProvider) .banners .length, padding: EdgeInsets.only(left: 16.w), itemBuilder: (context, index) => BannerItem( banner: ref .watch(homeProvider) .banners[index], ), ), ), ), 24.verticalSpace, state.isShopLoading ? const AllShopShimmer(isTitle: false) : state.shops.isEmpty ? _resultEmpty(colors) : ListView.builder( padding: AppHelpers.getType() == 2 ? EdgeInsets.symmetric(horizontal: 16.r) : EdgeInsets.only(top: 6.h), shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), scrollDirection: Axis.vertical, itemCount: state.shops.length, itemBuilder: (context, index) => AppHelpers.getType() == 0 ? MarketItem( shop: state.shops[index], isSimpleShop: true, ) : AppHelpers.getType() == 1 ? MarketOneItem( shop: state.shops[index], isSimpleShop: true, ) : AppHelpers.getType() == 2 ? MarketTwoItem( shop: state.shops[index], isSimpleShop: true, ) : MarketThreeItem( shop: state.shops[index], isSimpleShop: true, ), ), ], ), ), ), ), ], ), floatingActionButtonLocation: FloatingActionButtonLocation.startFloat, floatingActionButton: (colors) => widget.isBackButton ? Padding( padding: EdgeInsets.only(left: 16.w), child: const PopButton(), ) : const SizedBox.shrink(), ); } Widget _resultEmpty(CustomColorSet colors)`
*No documentation provided (generation failed).*
