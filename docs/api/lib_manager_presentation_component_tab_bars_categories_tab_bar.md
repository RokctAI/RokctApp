# API Reference: categories_tab_bar

Source file: `lib/manager/presentation/component/tab_bars/categories_tab_bar.dart`

## Classes

### class `CategoriesTabBar`

## Whitelisted API Endpoints

### `Function(int) onChangeTab; final Function() onLoading; final RefreshController refreshController; const CategoriesTabBar({ super.key, required this.categories, required this.activeIndex, required this.onChangeTab, required this.refreshController, required this.onLoading, }); @override Widget build(BuildContext context)`
*No documentation provided (generation failed).*

### `SizedBox(height: 36.r, child: SmartRefresher( physics: const BouncingScrollPhysics(), scrollDirection: Axis.horizontal, enablePullDown: false, enablePullUp: true, controller: refreshController, onLoading: onLoading, child: ListView.builder( physics: const NeverScrollableScrollPhysics(), scrollDirection: Axis.horizontal, itemCount: categories.length + 2, padding: REdgeInsets.symmetric(horizontal: 8), itemBuilder: (context, index)`
*No documentation provided (generation failed).*
