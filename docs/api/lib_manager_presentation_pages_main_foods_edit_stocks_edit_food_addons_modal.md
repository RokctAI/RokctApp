# API Reference: edit_food_addons_modal

Source file: `lib/manager/presentation/pages/main/foods/edit/stocks/edit_food_addons_modal.dart`

## Classes

### class `EditFoodAddonsModal`

## Whitelisted API Endpoints

### `Function(List<ProductData>) onSave; const EditFoodAddonsModal({ super.key, required this.stock, required this.onSave, }); @override ConsumerState<EditFoodAddonsModal> createState() => _EditFoodAddonsModalState(); } class _EditFoodAddonsModalState extends ConsumerState<EditFoodAddonsModal> { late RefreshController _refreshController; @override void initState()`
*No documentation provided (generation failed).*

### `dispose()`
*No documentation provided (generation failed).*

### `build(BuildContext context)`
*No documentation provided (generation failed).*

### `ModalWrap(body: Padding( padding: REdgeInsets.symmetric(horizontal: 16), child: Consumer( builder: (context, ref, child)`
*No documentation provided (generation failed).*

### `Column(children: [ const ModalDrag(), Expanded( child: state.isLoading ? Center( child: SizedBox( width: 30.r, height: 30.r, child: CircularProgressIndicator( strokeWidth: 4.r, color: AppStyle.blackColor, ), ), ) : SmartRefresher( enablePullDown: false, controller: _refreshController, child: ListView.builder( itemCount: state.addons.length, itemBuilder: (context, index) => SelectableAddonItem( addon: state.addons[index], isLast: state.addons.length - 1 == index, onTap: () => event.toggleAddonSelection(index), ), ), ), ), CustomButton( title: AppHelpers.getTranslation(TrKeys.save), onPressed: ()`
*No documentation provided (generation failed).*
