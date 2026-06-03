# API Reference: delete_extras_group_notifier

Source file: `lib/manager/application/main/foods/extras/delete/delete_extras_group_notifier.dart`

## Classes

### class `DeleteExtrasGroupNotifier`

## Whitelisted API Endpoints

### `DeleteExtrasGroupState()); Future<void> deleteExtrasGroup( BuildContext context, { VoidCallback? success, int? groupId, }) async { state = state.copyWith(isLoading: true); final response = await _productsRepository.deleteExtrasGroup( groupId: groupId, ); response.when( success: (data)`
*No documentation provided (generation failed).*
