# API Reference: register_notifier

Source file: `lib/core/application/auth/register/register_notifier.dart`

## Classes

### class `RegisterNotifier`

## Whitelisted API Endpoints

### `build() => const RegisterState(); void setPassword(String password)`
*No documentation provided (generation failed).*

### `setConfirmPassword(String password)`
*No documentation provided (generation failed).*

### `setFirstName(String name)`
*No documentation provided (generation failed).*

### `setEmail(String value)`
*No documentation provided (generation failed).*

### `setPhone(String value)`
*No documentation provided (generation failed).*

### `setLatName(String name)`
*No documentation provided (generation failed).*

### `setReferral(String name)`
*No documentation provided (generation failed).*

### `toggleShowPassword()`
*No documentation provided (generation failed).*

### `toggleShowConfirmPassword()`
*No documentation provided (generation failed).*

### `getProfileDetails() async { final response = await userRepository.getProfileDetails(); response.when( success: (data)`
*No documentation provided (generation failed).*

### `checkEmail()`
*No documentation provided (generation failed).*

### `sendCode(BuildContext context, VoidCallback onSuccess) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `sendCodeToNumber(BuildContext context, ValueChanged<String> onSuccess, ) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `register(BuildContext context) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `registerWithFirebase(BuildContext context) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `registerWithPhone(BuildContext context) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `loginWithSocial(BuildContext context, IconData type) async { state = state.copyWith(isLoading: true); Either<UserCredential, Dyn>? user; switch (type)`
*No documentation provided (generation failed).*

### `AddressNewModel(), ); userRepository.saveLocation( address: AddressNewModel( title: LocalStorage.getAddressSelected()?.title, address: AddressInformation( address: LocalStorage.getAddressSelected()?.address, ), location: [ LocalStorage.getAddressSelected()?.location?.longitude, LocalStorage.getAddressSelected()?.location?.latitude, ], ), ); LocalStorage.setAddressSelected( AddressData( title: model?.title ?? "", address: model?.address?.address ?? "", location: LocationData( longitude: model?.location?.last, latitude: model?.location?.first, ), ), ); } context.router.popUntilRoot(); final currentFlavor = AppConstants.flavor; if (currentFlavor == AppFlavor.manager)`
*No documentation provided (generation failed).*

### `ManagerMainRoute()); } else if (currentFlavor == AppFlavor.driver)`
*No documentation provided (generation failed).*
