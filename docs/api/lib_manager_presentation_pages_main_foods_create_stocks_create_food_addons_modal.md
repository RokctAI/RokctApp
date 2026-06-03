# API Reference: create_food_addons_modal

Source file: `lib/manager/presentation/pages/main/foods/create/stocks/create_food_addons_modal.dart`

## Classes

### class `CreateFoodAddonsModal`

## Whitelisted API Endpoints

### `Function(List<ProductData>) onSave; const CreateFoodAddonsModal({ super.key, required this.stock, required this.onSave, }); @override ConsumerState<CreateFoodAddonsModal> createState() => _CreateFoodAddonsModalState(); } class _CreateFoodAddonsModalState extends ConsumerState<CreateFoodAddonsModal> { late RefreshController _refreshController; @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `ModalWrap(body: Padding( padding: REdgeInsets.symmetric(horizontal: 16), child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Column(children: [ const ModalDrag(), Expanded( child: state.isLoading ? Center( child: SizedBox( width: 30.r, height: 30.r, child: CircularProgressIndicator( strokeWidth: 4.r, color: AppStyle.blackColor, ), ), ) : SmartRefresher( enablePullDown: false, controller: _refreshController, child: ListView.builder( itemCount: state.addons.length, itemBuilder: (context, index) => SelectableAddonItem( addon: state.addons[index], isLast: state.addons.length - 1 == index, onTap: () => event.toggleAddonSelection(index), ), ), ), ), CustomButton( title: AppHelpers.getTranslation(TrKeys.save), onPressed: ()`
*No documentation provided (generation failed).*
