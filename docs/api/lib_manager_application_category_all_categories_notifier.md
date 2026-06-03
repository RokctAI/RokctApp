# API Reference: all_categories_notifier

Source file: `lib/manager/application/category/all_categories_notifier.dart`

## Classes

### class `AllCategoriesNotifier`

## Whitelisted API Endpoints

### `updateCategories(BuildContext context, { RefreshController? controller, String? type, }) async { if (controller == null)`
*No documentation provided (generation failed).*

### `updateCategoriesSub(BuildContext context, { RefreshController? controller, }) async { if (controller == null)`
*No documentation provided (generation failed).*

### `setActiveIndex(int index, {bool isCombo = false})`
*No documentation provided (generation failed).*

### `setActiveIndexSub(int index)`
*No documentation provided (generation failed).*

### `setCategories(List<CategoryData> categories)`
*No documentation provided (generation failed).*

### `deleteCategories(CategoryData category) async { final res = await managerCatalogRepository.deleteCategory(id: category.id); res.when( success: (success)`
*No documentation provided (generation failed).*

### `fetchCategories(BuildContext context, { bool? isRefresh, RefreshController? controller, }) async { if (isRefresh ?? false)`
*No documentation provided (generation failed).*
