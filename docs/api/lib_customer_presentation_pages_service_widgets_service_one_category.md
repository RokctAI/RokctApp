# API Reference: service_one_category

Source file: `lib/customer/presentation/pages/service/widgets/service_one_category.dart`

## Classes

### class `ServiceOneCategory`

## Whitelisted API Endpoints

### `ServiceOneCategory({ super.key, required this.state, required this.event, required this.categoryIndex, required this.colors, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `SizedBox(height: state.categories.isNotEmpty ? 132.h : 0, child: AnimationLimiter( child: ListView.builder( padding: EdgeInsets.only(left: 16.r, bottom: 16.r, top: 8.r), shrinkWrap: true, scrollDirection: Axis.horizontal, itemCount: (state.categories[categoryIndex].children?.length ?? 0) + 1, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 375), child: SlideAnimation( verticalOffset: 50.0, child: FadeInAnimation( child: index == 0 ? AnimationButtonEffect( child: Padding( padding: REdgeInsets.only( right: 8, bottom: 32, top: 4, ), child: InkWell( borderRadius: BorderRadius.circular(24.r), onTap: ()`
*No documentation provided (generation failed).*

### `FilterPage(controller: c, categoryId: (state.selectIndexSubCategory != -1 ? (state .categories[state .selectIndexCategory] .children?[state .selectIndexSubCategory] .id) : state .categories[state .selectIndexCategory] .id) ?? 0, ), isDarkMode: false, isDrag: false, radius: 12, ); }, child: Container( width: 36.w, padding: EdgeInsets.symmetric( horizontal: 6.r, vertical: 4.r, ), decoration: BoxDecoration( color: AppStyle.black, boxShadow: const [ BoxShadow( color: AppStyle.shadow, blurRadius: 15, offset: Offset(0, 4), spreadRadius: 0, ), ], borderRadius: BorderRadius.circular(6.r), ), child: Center( child: SvgPicture.asset( "assets/svgs/menu.svg", height: 18.r, ), ), ), ), ), ) : CategoryOneItem( colors: colors, index: index - 1, image: category.children?[index - 1].img ?? "", title: category .children?[index - 1] .translation ?.title ?? "", isActive: index - 1 == state.selectIndexSubCategory, onTap: ()`
*No documentation provided (generation failed).*
