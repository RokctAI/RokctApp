# API Reference: delete_extras_item_notifier

Source file: `lib/manager/application/main/foods/extras/details/delete_item/delete_extras_item_notifier.dart`

## Classes

### class `DeleteExtrasItemNotifier`

## Whitelisted API Endpoints

### `DeleteExtrasItemState()); Future<void> deleteExtrasItem( BuildContext context, { VoidCallback? success, int? extrasId, }) async { state = state.copyWith(isLoading: true); final response = await _productsRepository.deleteExtrasItem( extrasId: extrasId ?? 0, ); response.when( success: (data)`
*No documentation provided (generation failed).*
