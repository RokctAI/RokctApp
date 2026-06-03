# API Reference: working_days_notifier

Source file: `lib/manager/application/restaurant/working_days/working_days_notifier.dart`

## Classes

### class `WorkingDaysNotifier`

## Whitelisted API Endpoints

### `WorkingDaysState()); Future<void> updateWorkingDays({ required List<ShopWorkingDays> days, String? shopUuid, VoidCallback? updateSuccess, }) async { state = state.copyWith(isLoading: true, workingDays: days); final response = await _usersRepository.updateShopWorkingDays( workingDays: days, uuid: shopUuid, ); response.when( success: (data)`
*No documentation provided (generation failed).*

### `setShopWorkingDays(List<ShopWorkingDays> workingDays) async { state = state.copyWith(workingDays: workingDays); } void changeIndex(ShopWorkingDays? day)`
*No documentation provided (generation failed).*
