# API Reference: order_user_notifier

Source file: `lib/manager/application/order/shipping/user/order_user_notifier.dart`

## Classes

### class `OrderUserNotifier`

## Whitelisted API Endpoints

### `addCreatedUser(UserData? user)`
*No documentation provided (generation failed).*

### `clearSelectedUserInfo()`
*No documentation provided (generation failed).*

### `setSelectedUser(int index)`
*No documentation provided (generation failed).*

### `setPhone(String value)`
*No documentation provided (generation failed).*

### `setQuery({RefreshController? refreshController, required String text})`
*No documentation provided (generation failed).*

### `Duration(milliseconds: 300), ()`
*No documentation provided (generation failed).*

### `fetchMoreUsers({RefreshController? refreshController}) async { if (!_hasMore)`
*No documentation provided (generation failed).*

### `refreshUsers({RefreshController? refreshController}) async { debugPrint('===> refresh users function called'); _page = 0; final response = await _usersRepository.searchUsers( query: _query.isEmpty ? null : _query.trim(), page: ++_page, ); response.when( success: (data)`
*No documentation provided (generation failed).*

### `initialFetchUsers({RefreshController? refreshController}) async { _query = ''; if (state.users.isNotEmpty)`
*No documentation provided (generation failed).*
