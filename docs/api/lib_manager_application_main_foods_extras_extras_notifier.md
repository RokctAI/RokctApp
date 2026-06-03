# API Reference: extras_notifier

Source file: `lib/manager/application/main/foods/extras/extras_notifier.dart`

## Classes

### class `ExtrasNotifier`

## Whitelisted API Endpoints

### `ExtrasState()); Future<void> fetchGroups({RefreshController? refreshController}) async { state = state.copyWith(isLoading: true); final response = await _productsRepository.getExtrasGroups( needOnlyValid: false, ); response.when( success: (data)`
*No documentation provided (generation failed).*
