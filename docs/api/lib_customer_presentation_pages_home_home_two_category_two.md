# API Reference: category_two

Source file: `lib/customer/presentation/pages/home/home_two/category_two.dart`

## Classes

### class `CategoryTwo`

## Whitelisted API Endpoints

### `CategoryTwo({ super.key, required this.state, required this.event, required this.categoryController, required this.onTap, required this.colors, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `CategoryTwoShimmer() : SizedBox( height: state.categories.isNotEmpty ? 132.h : 0, child: SmartRefresher( scrollDirection: Axis.horizontal, enablePullDown: false, enablePullUp: true, controller: categoryController, onLoading: () async { await event.fetchCategoriesPage(context, categoryController); }, child: AnimationLimiter( child: ListView.builder( padding: EdgeInsets.only(left: 16.r, bottom: 16.r, top: 8.r), shrinkWrap: true, scrollDirection: Axis.horizontal, itemCount: state.isCategoryLoading ? 5 : state.categories.length, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 375), child: SlideAnimation( verticalOffset: 50.0, child: FadeInAnimation( child: CategoryTwoItem( colors: colors, index: index, image: state.categories[index].img ?? "", title: state.categories[index].translation?.title ?? "", isActive: state.selectIndexCategory == index, onTap: ()`
*No documentation provided (generation failed).*
