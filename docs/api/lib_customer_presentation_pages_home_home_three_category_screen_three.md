# API Reference: category_screen_three

Source file: `lib/customer/presentation/pages/home/home_three/category_screen_three.dart`

## Classes

### class `CategoryScreenThree`

## Whitelisted API Endpoints

### `CategoryScreenThree({ super.key, required this.state, required this.event, required this.categoryController, required this.restaurantController, required this.colors, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `CategoryShimmerThree() : Container( height: state.categories.isNotEmpty ? 40.r : 0, margin: EdgeInsets.only( bottom: state.categories.isNotEmpty ? 16.h : 0, ), child: SmartRefresher( scrollDirection: Axis.horizontal, enablePullDown: false, enablePullUp: true, controller: categoryController, onLoading: () async { await event.fetchCategoriesPage(context, categoryController); }, child: AnimationLimiter( child: ListView.builder( padding: REdgeInsets.symmetric(horizontal: 12), shrinkWrap: true, scrollDirection: Axis.horizontal, itemCount: state.isCategoryLoading ? 5 : state.categories.length, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 375), child: SlideAnimation( verticalOffset: 50.0, child: FadeInAnimation( child: CategoryBarItemThree( image: state.categories[index].img ?? "", title: state.categories[index].translation?.title ?? "", isActive: state.selectIndexCategory == index, onTap: ()`
*No documentation provided (generation failed).*
