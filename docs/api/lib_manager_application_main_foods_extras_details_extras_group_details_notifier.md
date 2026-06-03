# API Reference: extras_group_details_notifier

Source file: `lib/manager/application/main/foods/extras/details/extras_group_details_notifier.dart`

## Classes

### class `ExtrasGroupDetailsNotifier`

## Whitelisted API Endpoints

### `ExtrasGroupDetailsState()); Future<void> fetchGroupExtras({int? groupId}) async { state = state.copyWith(isLoading: true); final response = await _productsRepository.getExtras(groupId: groupId); response.when( success: (data)`
*No documentation provided (generation failed).*
