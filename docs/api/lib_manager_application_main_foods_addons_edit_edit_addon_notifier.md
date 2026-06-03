# API Reference: edit_addon_notifier

Source file: `lib/manager/application/main/foods/addons/edit/edit_addon_notifier.dart`

## Classes

### class `EditAddonNotifier`

## Whitelisted API Endpoints

### `EditAddonState()); void setQuantity(String value)`
*No documentation provided (generation failed).*

### `setPrice(String value)`
*No documentation provided (generation failed).*

### `setTax(String value)`
*No documentation provided (generation failed).*

### `setActive(bool? value)`
*No documentation provided (generation failed).*

### `setDesc()`
*No documentation provided (generation failed).*

### `updateAddon(BuildContext context, { String? uuid, UnitData? unit, VoidCallback? updated, VoidCallback? failed, }) async { setDesc(); state = state.copyWith(isLoading: true); final response = await _productsRepository.updateProduct( interval: "1", tax: _tax, maxQty: '10000', minQty: '1', qrcode: _barcode == _oldBarcode ? null : _barcode, active: _active, unitId: unit?.id, uuid: uuid, needAddons: true, titlesAndDescriptions: state.mapOfDesc, ); response.when( success: (data) async { final stockResponse = await _productsRepository.updateStocks( deletedStocks: [], stocks: [ Stock( quantity: int.tryParse(_quantity), price: num.tryParse(_price), ), ], uuid: data.data?.uuid, isAddon: true, ); stockResponse.when( success: (stockData)`
*No documentation provided (generation failed).*

### `setBarcode(String value)`
*No documentation provided (generation failed).*

### `setDescription(String value)`
*No documentation provided (generation failed).*

### `setTitle(String value)`
*No documentation provided (generation failed).*

### `setAddonDetails(ProductData addon)`
*No documentation provided (generation failed).*
