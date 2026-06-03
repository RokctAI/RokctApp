# API Reference: app_validators

Source file: `lib/core/infrastructure/utils/app_validators.dart`

## Classes

### class `AppValidators`

## Whitelisted API Endpoints

### `isValidEmail(String email) => RegExp( "^[a-zA-Z0-9.!#\$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*\$", ).hasMatch(email); static bool checkEmail(String email) => RegExp("/^[0-9 ()+-]+\$/").hasMatch(email); static bool isValidPassword(String password) => password.length > 5; static String? isNotEmptyValidator(String? title)`
*No documentation provided (generation failed).*

### `isValidConfirmPassword(String password, String confirmPassword) => password == confirmPassword; static bool arePasswordsTheSame(String password, String confirmPassword) => password == confirmPassword; static bool isValidPhone(String input) => RegExp(r"^\+?[0-9]{7,15}$").hasMatch(input); static String detectType(String input)`
*No documentation provided (generation failed).*
