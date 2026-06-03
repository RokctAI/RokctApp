# API Reference: foods_page

Source file: `lib/manager/presentation/pages/main/foods/foods_page.dart`

## Classes

### class `FoodsPage`

## Whitelisted API Endpoints

### `FoodsPage({super.key}); @override ConsumerState<FoodsPage> createState() => _FoodsPageState(); } class _FoodsPageState extends ConsumerState<FoodsPage> with SingleTickerProviderStateMixin { late TabController _tabController; late ScrollController _scrollController; late RefreshController _categoryController; late RefreshController _productController; late RefreshController _addonsController; late RefreshController _extrasController; late RefreshController _comboController; @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `KeyboardDisable(child: Scaffold( backgroundColor: AppStyle.textGrey, body: Column( children: [ CustomAppBar( bottomPadding: 4.h, child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `SearchTextField(onChanged: (value) => foodsEvent.setQuery( query: value, categoryId: categoriesState.activeIndex == 1 ? null : categoriesState .categories[categoriesState.activeIndex - 2] .id, ), suffixIcon: ButtonsBouncingEffect( child: GestureDetector( onTap: ()`
*No documentation provided (generation failed).*
