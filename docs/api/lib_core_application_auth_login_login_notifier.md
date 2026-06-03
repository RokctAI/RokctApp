# API Reference: login_notifier

Source file: `lib/core/application/auth/login/login_notifier.dart`

## Classes

### class `LoginNotifier`

## Whitelisted API Endpoints

### `build() => const LoginState(); void setAgreedToTerms(bool agree)`
*No documentation provided (generation failed).*

### `setPassword(String text)`
*No documentation provided (generation failed).*

### `setEmail(String text)`
*No documentation provided (generation failed).*

### `setPhone(String text)`
*No documentation provided (generation failed).*

### `setShowPassword(bool show)`
*No documentation provided (generation failed).*

### `checkEmail()`
*No documentation provided (generation failed).*

### `checkLanguage(BuildContext context) async { final lang = LocalStorage.getLanguage(); if (lang == null)`
*No documentation provided (generation failed).*

### `getProfileDetails(BuildContext context) async { final response = await userRepository.getProfileDetails(); response.when( success: (data)`
*No documentation provided (generation failed).*

### `login(BuildContext context, { VoidCallback? checkYourNetwork, VoidCallback? loginSuccess, VoidCallback? youAreNotDeliveryman, VoidCallback? seller, VoidCallback? admin, VoidCallback? accessDenied, }) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*

### `getProfileDetails(context); if (currentFlavor == AppFlavor.manager)`
*No documentation provided (generation failed).*

### `loginWithSocial(BuildContext context, IconData type) async { state = state.copyWith(isLoading: true); Either<UserCredential, Dyn>? user; switch (type)`
*No documentation provided (generation failed).*

### `ManagerMainRoute()); } else if (currentFlavor == AppFlavor.driver)`
*No documentation provided (generation failed).*
