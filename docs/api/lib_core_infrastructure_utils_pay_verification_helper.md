# API Reference: pay_verification_helper

Source file: `lib/core/infrastructure/utils/pay_verification_helper.dart`

## Classes

### class `PayVerificationHelper`

## Whitelisted API Endpoints

### `Exception("Shop secret is missing. Cannot generate verification code.", ); } final normalizedAmount = amount.toStringAsFixed(2); final salt = secret; final rawString = "$orderId|$normalizedAmount|$shopId|$salt"; final bytes = utf8.encode(rawString); final digest = sha256.convert(bytes); int hashInt = 0; for (int i = 0; i < 4; i++)`
Generates a 5-digit verification code based on transaction details.
This logic MUST be identical to the backend implementation.
static String generateVerificationCode({
required String orderId,
required double amount,
required String shopId,
required String? secret,
}) {
if (secret == null || secret.isEmpty) {

### `verifyCode({ required String enteredCode, required String orderId, required double amount, required String shopId, required String? secret, })`
*No documentation provided (generation failed).*
