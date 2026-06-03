# API Reference: add_category_notifier

Source file: `lib/manager/application/category/add/add_category_notifier.dart`

## Classes

### class `AddCategoryNotifier`

## Whitelisted API Endpoints

### `AddCategoryState()); Future<void> createCategory( BuildContext context, { VoidCallback? success, }) async { state = state.copyWith(isLoading: true); final response = await _catalogRepository.createCategory( title: _title, input: int.tryParse(_input), ); response.when( success: (data)`
*No documentation provided (generation failed).*

### `setTitle(String value)`
*No documentation provided (generation failed).*

### `setInput(String value)`
*No documentation provided (generation failed).*
