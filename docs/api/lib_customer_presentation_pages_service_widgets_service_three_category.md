# API Reference: service_three_category

Source file: `lib/customer/presentation/pages/service/widgets/service_three_category.dart`

## Classes

### class `ServiceThreeCategory`

## Whitelisted API Endpoints

### `ServiceThreeCategory({ super.key, required this.state, required this.event, required this.categoryIndex, required this.colors, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `CategoryShimmerThree() : Container( height: state.categories.isNotEmpty ? 40.h : 0, margin: EdgeInsets.only( bottom: state.categories.isNotEmpty ? 26.h : 0, ), child: AnimationLimiter( child: ListView.builder( padding: REdgeInsets.symmetric(horizontal: 12), shrinkWrap: true, scrollDirection: Axis.horizontal, itemCount: (state.categories[categoryIndex].children?.length ?? 0) + 1, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `FilterPage(controller: c, categoryId: (state.selectIndexSubCategory != -1 ? (state .categories[state .selectIndexCategory] .children?[state .selectIndexSubCategory] .id) : state .categories[state .selectIndexCategory] .id) ?? 0, ), isDarkMode: false, isDrag: false, radius: 12, ); }, child: Container( width: 44.w, padding: EdgeInsets.symmetric( horizontal: 6.r, vertical: 4.r, ), decoration: BoxDecoration( color: AppStyle.black, borderRadius: BorderRadius.circular(14.r), ), child: Center( child: SvgPicture.asset( "assets/svgs/menu.svg", height: 18.r, ), ), ), ), ), ) : AnimationConfiguration.staggeredList( position: index, duration: const Duration(milliseconds: 375), child: SlideAnimation( verticalOffset: 50.0, child: FadeInAnimation( child: CategoryBarItemThree( image: category.children?[index - 1].img ?? "", title: category .children?[index - 1] .translation ?.title ?? "", isActive: index - 1 == state.selectIndexSubCategory, onTap: ()`
*No documentation provided (generation failed).*
