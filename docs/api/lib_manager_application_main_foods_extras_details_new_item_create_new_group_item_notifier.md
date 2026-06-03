# API Reference: create_new_group_item_notifier

Source file: `lib/manager/application/main/foods/extras/details/new_item/create_new_group_item_notifier.dart`

## Classes

### class `CreateNewGroupItemNotifier`

## Whitelisted API Endpoints

### `CreateNewGroupItemState()); Future<void> createExtrasItem( BuildContext context, { VoidCallback? success, int? groupId, }) async { state = state.copyWith(isLoading: true); final response = await _productsRepository.createExtrasItem( title: _title, groupId: groupId ?? 0, ); response.when( success: (data)`
*No documentation provided (generation failed).*

### `setTitle(String value)`
*No documentation provided (generation failed).*
