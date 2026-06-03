# API Reference: edit_extras_item_notifier

Source file: `lib/manager/application/main/foods/extras/details/edit_item/edit_extras_item_notifier.dart`

## Classes

### class `EditExtrasItemNotifier`

## Whitelisted API Endpoints

### `EditExtrasItemState()); Future<void> updateExtrasItem( BuildContext context, { VoidCallback? success, int? groupId, int? extrasId, }) async { state = state.copyWith(isLoading: true); final response = await _productsRepository.updateExtrasItem( extrasId: extrasId ?? 0, title: _title, groupId: groupId ?? 0, ); response.when( success: (data)`
*No documentation provided (generation failed).*

### `setTitle(String value)`
*No documentation provided (generation failed).*
