# API Reference: category_screen

Source file: `lib/customer/presentation/pages/home/widgets/category_screen.dart`

## Classes

### class `CategoryScreen`

## Whitelisted API Endpoints

### `CategoryScreen({ super.key, required this.state, required this.event, required this.categoryController, required this.restaurantController, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `CategoryShimmer() : Container( height: state.categories.isNotEmpty ? 90.h : 0, margin: EdgeInsets.only( bottom: state.categories.isNotEmpty ? 26.h : 0, ), child: SmartRefresher( scrollDirection: Axis.horizontal, enablePullDown: false, enablePullUp: true, controller: categoryController, onLoading: () async { await event.fetchCategoriesPage(context, categoryController); }, child: AnimationLimiter( child: ListView.builder( padding: EdgeInsets.only(left: 16.r), shrinkWrap: true, scrollDirection: Axis.horizontal, itemCount: state.isCategoryLoading ? 5 : state.categories.length, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 375), child: SlideAnimation( verticalOffset: 50.0, child: FadeInAnimation( child: CategoryBarItem( index: index, image: state.categories[index].img ?? "", title: state.categories[index].translation?.title ?? "", isActive: state.selectIndexCategory == index, onTap: ()`
*No documentation provided (generation failed).*
