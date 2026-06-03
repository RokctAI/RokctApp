# API Reference: register_confirmation_notifier

Source file: `lib/core/application/auth/confirmation/register_confirmation_notifier.dart`

## Classes

### class `RegisterConfirmationNotifier`

## Whitelisted API Endpoints

### `build() => const RegisterConfirmationState(); Timer? _timer; int _initialTime = 30; void setCode(String? code)`
*No documentation provided (generation failed).*

### `confirmCodeWithPhone({ required BuildContext context, required String verificationId, VoidCallback? onSuccess, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `AddressNewModel(); }, ) .title ?? "", address: data.data?.user?.addresses ?.firstWhere( (element) => element.active ?? false, orElse: ()`
*No documentation provided (generation failed).*

### `AddressNewModel(); }, ) .address ?.address ?? "", location: LocationData( longitude: data.data?.user?.addresses ?.firstWhere( (element) => element.active ?? false, orElse: ()`
*No documentation provided (generation failed).*

### `AddressNewModel(); }, ) .location ?.last, latitude: data.data?.user?.addresses ?.firstWhere( (element) => element.active ?? false, orElse: ()`
*No documentation provided (generation failed).*

### `AddressNewModel(); }, ) .location ?.first, ), ), ); onSuccess?.call(); }, failure: (failure, status)`
*No documentation provided (generation failed).*

### `confirmCode(BuildContext context) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `confirmCodeResetPassword(BuildContext context, String email, ) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `confirmCodeResetPasswordWithPhone(BuildContext context, String phone, String verificationId, ) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `AddressNewModel(); }, ) .title ?? "", address: data.data?.user?.addresses ?.firstWhere( (element) => element.active ?? false, orElse: ()`
*No documentation provided (generation failed).*

### `AddressNewModel(); }, ) .address ?.address ?? "", location: LocationData( longitude: data.data?.user?.addresses ?.firstWhere( (element) => element.active ?? false, orElse: ()`
*No documentation provided (generation failed).*

### `AddressNewModel(); }, ) .location ?.last, latitude: data.data?.user?.addresses ?.firstWhere( (element) => element.active ?? false, orElse: ()`
*No documentation provided (generation failed).*

### `AddressNewModel(); }, ) .location ?.first, ), ), ); }, failure: (failure, status)`
*No documentation provided (generation failed).*

### `resendConfirmation(BuildContext context, String email, { bool isResetPassword = false, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `sendCodeToNumber(BuildContext context, String phoneNumber, ) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `resendResetConfirmation(BuildContext context, String phoneNumber, ) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `disposeTimer()`
*No documentation provided (generation failed).*

### `startTimer()`
*No documentation provided (generation failed).*

### `Duration(seconds: 1), (timer)`
*No documentation provided (generation failed).*

### `formatHHMMSS(int seconds)`
*No documentation provided (generation failed).*
