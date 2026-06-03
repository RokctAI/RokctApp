# API Reference: edit_food_categories_modal

Source file: `lib/manager/presentation/pages/main/foods/edit/details/edit_food_categories_modal.dart`

## Classes

### class `EditFoodCategoriesModal`

## Whitelisted API Endpoints

### `EditFoodCategoriesModal({super.key}); @override ConsumerState<EditFoodCategoriesModal> createState() => _EditFoodCategoriesScreenState(); } class _EditFoodCategoriesScreenState extends ConsumerState<EditFoodCategoriesModal> { @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `ModalWrap(body: Padding( padding: REdgeInsets.symmetric(horizontal: 16), child: SingleChildScrollView( physics: const BouncingScrollPhysics(), child: Column( children: [ const ModalDrag(), TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.categories), titleSize: 16, ), Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `NeverScrollableScrollPhysics(), padding: EdgeInsets.zero, shrinkWrap: true, itemCount: state.categories.length, itemBuilder: (context, index) => FoodCategoryItem( category: state.categories[index], onTap: ()`
*No documentation provided (generation failed).*
