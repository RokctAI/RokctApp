# API Reference: filter_category_service

Source file: `lib/customer/presentation/pages/service/filter_category_service.dart`

## Classes

### class `FilterCategoryService`

## Whitelisted API Endpoints

### `FilterCategoryService({ super.key, required this.state, required this.event, required this.categoryIndex, required this.restaurantController, required this.colors, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `SmartRefresher(enablePullDown: true, enablePullUp: true, physics: const BouncingScrollPhysics(), controller: restaurantController, header: WaterDropMaterialHeader( distance: 160.h, backgroundColor: AppStyle.white, color: AppStyle.textGrey, ), onLoading: ()`
*No documentation provided (generation failed).*

### `Loading() : state.filterShops.isNotEmpty ? ListView.builder( padding: REdgeInsets.symmetric(vertical: 12), shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), scrollDirection: Axis.vertical, itemCount: state.filterShops.length, itemBuilder: (context, index) => Padding( padding: REdgeInsets.only(bottom: 12), child: AppHelpers.getType() == 1 ? MarketOneItem( shop: state.filterShops[index], isSimpleShop: true, ) : AppHelpers.getType() == 2 ? MarketTwoItem( shop: state.filterShops[index], isSimpleShop: true, isFilter: true, ) : AppHelpers.getType() == 3 ? MarketThreeItem( shop: state.filterShops[index], isSimpleShop: true, ) : MarketItem( shop: state.filterShops[index], isSimpleShop: true, ), ), ) : Padding( padding: EdgeInsets.only(top: 24.h), child: _resultEmpty(), ), ], ), ), ); } } Widget _resultEmpty()`
*No documentation provided (generation failed).*
