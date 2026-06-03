# API Reference: update_extras_group_notifier

Source file: `lib/manager/application/main/foods/extras/update/update_extras_group_notifier.dart`

## Classes

### class `UpdateExtrasGroupNotifier`

## Whitelisted API Endpoints

### `UpdateExtrasGroupState()); Future<void> updateExtrasGroup( BuildContext context, { VoidCallback? success, int? groupId, }) async { state = state.copyWith(isLoading: true); final response = await _productsRepository.updateExtrasGroup( title: _title, groupId: groupId, ); response.when( success: (data)`
*No documentation provided (generation failed).*

### `setTitle(String value)`
*No documentation provided (generation failed).*
