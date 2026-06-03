# API Reference: create_food_stocks_body

Source file: `lib/manager/presentation/pages/main/foods/create/stocks/create_food_stocks_body.dart`

## Classes

### class `CreateFoodStocksBody`

## Whitelisted API Endpoints

### `CreateFoodStocksBody({super.key}); @override ConsumerState<CreateFoodStocksBody> createState() => _CreateFoodStocksBodyState(); } class _CreateFoodStocksBodyState extends ConsumerState<CreateFoodStocksBody> { final _formKey = GlobalKey<FormState>(); @override void initState()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `KeyboardDisable(child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Column(crossAxisAlignment: CrossAxisAlignment.start, children: [ 10.verticalSpace, SizedBox( height: 60.r, child: ListView.builder( itemCount: state.groups.length, scrollDirection: Axis.horizontal, shrinkWrap: true, padding: REdgeInsets.symmetric(horizontal: 16), physics: const BouncingScrollPhysics(), itemBuilder: (context, index) => ExtrasItem( extras: state.groups[index], onTap: ()`
*No documentation provided (generation failed).*

### `BouncingScrollPhysics(), itemBuilder: (context, index)`
*No documentation provided (generation failed).*

### `EditableFoodStockItem(key: UniqueKey(), isDeletable: index != 0, stock: state.stocks[index], onDeleteStock: () => event.deleteStock(index), onPriceChange: (value) => event.setPrice(value: value, index: index), onQuantityChange: (value) => event.setQuantity(value: value, index: index), onAddonTap: (context) => AppHelpers.showCustomModalBottomSheet( paddingTop: MediaQuery.paddingOf(context).top + 150, context: context, radius: 12, modal: CreateFoodAddonsModal( stock: state.stocks[index], onSave: (addons) => event.setStockAddons(addons, index), ), isDarkMode: true, ), onSkuChange: (value)`
*No documentation provided (generation failed).*
