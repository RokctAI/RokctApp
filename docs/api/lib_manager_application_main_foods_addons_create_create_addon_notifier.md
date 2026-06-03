# API Reference: create_addon_notifier

Source file: `lib/manager/application/main/foods/addons/create/create_addon_notifier.dart`

## Classes

### class `CreateAddonNotifier`

## Whitelisted API Endpoints

### `CreateAddonState()); void setQuantity(String value)`
*No documentation provided (generation failed).*

### `setPrice(String value)`
*No documentation provided (generation failed).*

### `updateAddonInfo()`
*No documentation provided (generation failed).*

### `setBarcode(String value)`
*No documentation provided (generation failed).*

### `createAddon(BuildContext context, { int? unitId, VoidCallback? created, VoidCallback? failed, }) async { state = state.copyWith(isLoading: true); final response = await _productsRepository.createProduct( title: _title, description: _description, tax: _tax, minQty: '1', maxQty: '10000', interval: "1", active: _active, qrcode: _barcode, unitId: unitId, isAddon: true, ); response.when( success: (data) async { final stockResponse = await _productsRepository.updateStocks( deletedStocks: [], stocks: [ Stock( quantity: int.tryParse(_quantity), price: num.tryParse(_price), sku: _barcode, ), ], uuid: data.data?.uuid, isAddon: true, ); stockResponse.when( success: (stockData)`
*No documentation provided (generation failed).*

### `setActive(bool? value)`
*No documentation provided (generation failed).*

### `setTax(String value)`
*No documentation provided (generation failed).*

### `setDescription(String value)`
*No documentation provided (generation failed).*

### `setTitle(String value)`
*No documentation provided (generation failed).*
