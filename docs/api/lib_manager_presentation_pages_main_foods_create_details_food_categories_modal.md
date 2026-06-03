# API Reference: food_categories_modal

Source file: `lib/manager/presentation/pages/main/foods/create/details/food_categories_modal.dart`

## Classes

### class `FoodCategoriesModal`

## Whitelisted API Endpoints

### `FoodCategoriesModal({super.key, this.isSubCategory = false, this.type}); @override ConsumerState<FoodCategoriesModal> createState() => _FoodCategoriesModalState(); } class _FoodCategoriesModalState extends ConsumerState<FoodCategoriesModal> { @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `ModalWrap(body: Column( children: [ const ModalDrag(), if (!widget.isSubCategory) GestureDetector( onTap: () => AppHelpers.showCustomModalBottomSheet( context: context, paddingTop: 100, modal: const AddCategoryModal(), isDarkMode: false, ), child: Row( mainAxisAlignment: MainAxisAlignment.center, children: [ Icon( FlutterRemix.play_list_add_line, color: AppStyle.blue, size: 18.r, ), 10.horizontalSpace, Text( AppHelpers.getTranslation(TrKeys.addNewCategory), style: AppStyle.interSemi( size: 14, color: AppStyle.blue, letterSpacing: -0.3, ), ), ], ), ), 16.verticalSpace, Divider(color: AppStyle.toggle, height: 1.r, thickness: 1.r), 24.verticalSpace, Expanded( child: Padding( padding: REdgeInsets.symmetric(horizontal: 16), child: SingleChildScrollView( physics: const BouncingScrollPhysics(), child: Column( children: [ TitleAndIcon( title: AppHelpers.getTranslation(TrKeys.categories), titleSize: 16, ), Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `NeverScrollableScrollPhysics(), padding: EdgeInsets.zero, shrinkWrap: true, itemCount: currentCategories.length, itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `FoodCategoryItem(category: currentCategories[index], onTap: ()`
*No documentation provided (generation failed).*
