# API Reference: category_one

Source file: `lib/customer/presentation/pages/home/home_one/category_one.dart`

## Classes

### class `CategoryOne`

## Whitelisted API Endpoints

### `CategoryOne({ super.key, required this.state, required this.event, required this.categoryController, required this.restaurantController, required this.colors, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `CategoryOneShimmer() : Container( height: state.categories.isNotEmpty ? 100.h : 0, margin: EdgeInsets.only( bottom: state.categories.isNotEmpty ? 26.h : 0, ), child: SmartRefresher( scrollDirection: Axis.horizontal, enablePullDown: false, enablePullUp: true, controller: categoryController, onLoading: () async { await event.fetchCategoriesPage(context, categoryController); }, child: AnimationLimiter( child: ListView.builder( shrinkWrap: true, scrollDirection: Axis.horizontal, padding: EdgeInsets.only(left: 16.r), itemCount: state.isCategoryLoading ? 5 : state.categories.length, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 375), child: SlideAnimation( verticalOffset: 50.0, child: FadeInAnimation( child: CategoryOneItem( colors: colors, index: index, image: state.categories[index].img ?? "", title: state.categories[index].translation?.title ?? "", isActive: state.selectIndexCategory == index, onTap: ()`
*No documentation provided (generation failed).*
