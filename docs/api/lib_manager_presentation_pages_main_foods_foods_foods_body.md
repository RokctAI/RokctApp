# API Reference: foods_body

Source file: `lib/manager/presentation/pages/main/foods/foods/foods_body.dart`

## Classes

### class `FoodsBody`

## Whitelisted API Endpoints

### `FoodsBody({ super.key, required this.categoryController, required this.productController, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `Column(children: [ 24.verticalSpace, Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Padding(padding: REdgeInsets.symmetric(horizontal: 16), child: Row( children: [ Expanded( child: GestureDetector( onTap: ()`
*No documentation provided (generation failed).*

### `TabBarLoading() : SizedBox( height: 36.h, child: CategoriesTabBar( categories: currentCategories, activeIndex: currentActiveIndex, refreshController: categoryController, onChangeTab: (index)`
*No documentation provided (generation failed).*

### `ProductsBody(itemSpacing: 10, isLoading: productsState.isLoading, products: productsState.foods, refreshController: productController, scrollPhysics: const NeverScrollableScrollPhysics(), onRefreshing: () => productsEvent.refreshProducts( refreshController: productController, ), onLoading: () => productsEvent.fetchMoreProducts( refreshController: productController, ), onProductTap: (index)`
*No documentation provided (generation failed).*
