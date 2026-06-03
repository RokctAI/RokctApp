# API Reference: create_extras_group_notifier

Source file: `lib/manager/application/main/foods/extras/create/create_extras_group_notifier.dart`

## Classes

### class `CreateExtrasGroupNotifier`

## Whitelisted API Endpoints

### `CreateExtrasGroupState()); Future<void> createExtrasGroup( BuildContext context, { VoidCallback? success, }) async { state = state.copyWith(isLoading: true); final response = await _productsRepository.createExtrasGroup(title: _title); response.when( success: (data)`
*No documentation provided (generation failed).*

### `setTitle(String value)`
*No documentation provided (generation failed).*
