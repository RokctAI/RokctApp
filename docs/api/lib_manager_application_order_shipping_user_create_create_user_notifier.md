# API Reference: create_user_notifier

Source file: `lib/manager/application/order/shipping/user/create/create_user_notifier.dart`

## Classes

### class `CreateUserNotifier`

## Whitelisted API Endpoints

### `CreateUserState()); void setEmail(String value)`
*No documentation provided (generation failed).*

### `setPhone(String value)`
*No documentation provided (generation failed).*

### `setLastname(String value)`
*No documentation provided (generation failed).*

### `setFirstname(String value)`
*No documentation provided (generation failed).*

### `createUser(BuildContext context, { Function(UserData?)? created, VoidCallback? failed, }) async { state = state.copyWith(isLoading: true); final response = await _usersRepository.createUser( firstname: _firstname, lastname: _lastname, phone: _phone, email: _email, ); response.when( success: (data)`
*No documentation provided (generation failed).*
