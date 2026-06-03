# API Reference: edit_food_stocks_notifier

Source file: `lib/manager/application/foods/edit/stocks/edit_food_stocks_notifier.dart`

## Classes

### class `EditFoodStocksNotifier`

## Whitelisted API Endpoints

### `EditFoodStocksState()); void setStockAddons(List<ProductData> addons, int stockIndex)`
*No documentation provided (generation failed).*

### `toggleCheckedGroup(int groupIndex)`
*No documentation provided (generation failed).*

### `fetchGroups({required ProductData product}) async { if (state.groups.isNotEmpty)`
*No documentation provided (generation failed).*

### `setActiveExtrasIndex({ required int itemIndex, required int groupIndex, }) async { String key = state.groups[groupIndex].id.toString(); Extras extras = state.groups[groupIndex].fetchedExtras![itemIndex]; Map<String, List<Extras?>> selectGroups = Map.from(state.selectGroups); if (selectGroups.containsKey(key))`
*No documentation provided (generation failed).*

### `combination()`
*No documentation provided (generation failed).*

### `Stock(extras: list[index]), ); } else { stocks = [Stock()]; } for (int i = 0; i < _oldStocks.length; i++)`
*No documentation provided (generation failed).*

### `fetchGroupExtras(BuildContext context, { required int groupIndex, VoidCallback? onSuccess, }) async { if (state.groups[groupIndex].fetchedExtras?.isNotEmpty ?? false)`
*No documentation provided (generation failed).*

### `deleteStock(int index)`
save fetched extras to groups
List<Group> groups = List.from(state.groups);
int mainGroupIndex = 0;
for (int i = 0; i < groups.length; i++) {
if (groups[i].id == activeGroups[groupIndex].id) {
mainGroupIndex = i;
}
}
groups[mainGroupIndex] = groups[mainGroupIndex].copyWith(
fetchedExtras: fetchedExtras,
);
state = state.copyWith(
isLoading: false,
activeGroupExtras: fetchedExtras,
groups: groups,
stocks: _localStocks,
);
},
failure: (fail, status) {
state = state.copyWith(isLoading: false);
AppHelpers.showCheckTopSnackBar(
context,
text: fail.toString(),
type: SnackBarType.error,
);
debugPrint('===> group extras fetching failed $fail');
},
);
}

### `setQuantity({required String value, required int index})`
*No documentation provided (generation failed).*

### `setPrice({required String value, required int index})`
*No documentation provided (generation failed).*

### `setSku({required String value, required int index})`
*No documentation provided (generation failed).*

### `updateStocks(BuildContext context, { String? uuid, VoidCallback? updated, VoidCallback? failed, }) async { state = state.copyWith(isSaving: true); final response = await _productsRepository.updateStocks( stocks: _localStocks, uuid: uuid, deletedStocks: state.deleteStocks, ); response.when( success: (data)`
*No documentation provided (generation failed).*

### `addEmptyStock()`
*No documentation provided (generation failed).*

### `setInitialStocks(ProductData? product)`
*No documentation provided (generation failed).*
