# API Reference: shop_page

Source file: `lib/customer/presentation/pages/shop/shop_page.dart`

## Classes

### class `ShopPage`

## Whitelisted API Endpoints

### `ShopPage({ super.key, required this.shopId, this.productId, this.cartId, this.shop, this.ownerId, }); @override ConsumerState<ShopPage> createState() => _ShopPageState(); } class _ShopPageState extends ConsumerState<ShopPage> with TickerProviderStateMixin { late ShopNotifier event; late LikeNotifier eventLike; late TextEditingController name; late TextEditingController search; ScrollController scrollController = ScrollController(); late TabController _tabController; @override void initState()`
*No documentation provided (generation failed).*

### `CustomButton(isLoading: ref.watch(shopProvider).isJoinOrder, title: AppHelpers.getTranslation(TrKeys.join), onPressed: ()`
*No documentation provided (generation failed).*

### `ProductScreen(productId: widget.productId, controller: c), isDarkMode: false, isDrag: true, radius: 16, ); } WidgetsBinding.instance.addPostFrameCallback((_)`
*No documentation provided (generation failed).*

### `didChangeDependencies()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `KeyboardDismisser(child: Directionality( textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl, child: WillPopScope( onWillPop: ()`
*No documentation provided (generation failed).*

### `Loading() : CustomScrollView( controller: scrollController, slivers: [ SliverAppBar( backgroundColor: colors.backgroundColor, toolbarHeight: (140 + 300.r + ((state .shopData ?.translation ?.description ?.length ?? 0) > 40 ? 30 : 0) + (AppHelpers.getGroupOrder() ? 60.r : 0.r) + (state.shopData?.bonus == null ? 0 : 46.r) + (state.endTodayTime.isAfter(TimeOfDay.now()) ? 0 : 70.r)), elevation: 0.0, leading: SizedBox.shrink(), flexibleSpace: FlexibleSpaceBar( background: ShopPageAvatar( workTime: state.endTodayTime.isBefore(TimeOfDay.now()) ? AppHelpers.getTranslation(TrKeys.close) : "${TimeService.timeFormatTime(state.startTodayTime.format(context))} - ${TimeService.timeFormatTime(state.endTodayTime.format(context))}", onLike: ()`
*No documentation provided (generation failed).*

### `Padding(padding: EdgeInsets.all(16.h), child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[ PopButton( onTap: ()`
*No documentation provided (generation failed).*

### `CartOrderPage(controller: c, isGroupOrder: state.isGroupOrder, cartId: widget.cartId, shopId: widget.shopId, colors: colors, ), isDarkMode: false, isDrag: true, radius: 12, ); }, child: AnimationButtonEffect( child: Container( decoration: BoxDecoration( color: colors.primary, borderRadius: BorderRadius.all( Radius.circular(10.r), ), ), padding: EdgeInsets.symmetric( vertical: 8.r, horizontal: 10.r, ), child: Row( children: [ Icon( FlutterRemix.shopping_bag_3_line, color: colors.buttonFontColor, ), 12.horizontalSpace, Container( padding: EdgeInsets.symmetric( vertical: 8.h, horizontal: 14.w, ), decoration: BoxDecoration( color: AppStyle.black, borderRadius: BorderRadius.all( Radius.circular(18.r), ), ), child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `SingleChildScrollView(child: state.isProductLoading ? const ShimmerProductList() : Column( children: List.generate(state.allData.length, (index)`
*No documentation provided (generation failed).*

### `build(BuildContext context, double shrinkOffset, bool overlapsContent,)`
*No documentation provided (generation failed).*

### `shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate)`
*No documentation provided (generation failed).*
