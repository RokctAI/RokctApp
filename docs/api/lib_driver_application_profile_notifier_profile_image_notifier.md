# API Reference: profile_image_notifier

Source file: `lib/driver/application/profile/notifier/profile_image_notifier.dart`

## Classes

### class `ProfileImageNotifier`

## Whitelisted API Endpoints

### `ProfileImageState()); Future<void> updateProfileImage({ required BuildContext context, required String path, String? firstname, }) async { String? url; final imageResponse = await _settingsRepository.uploadImage( path, UploadType.users, ); imageResponse.when( success: (data)`
*No documentation provided (generation failed).*

### `editCarImage({ required BuildContext context, required String path, }) async { final imageResponse = await _settingsRepository.uploadImage( path, UploadType.deliveryCar, ); imageResponse.when( success: (data)`
*No documentation provided (generation failed).*

### `setUrlCar(String? url)`
*No documentation provided (generation failed).*

### `changePhoto({ String? path, String? firstname, required BuildContext context, })`
*No documentation provided (generation failed).*

### `setUrl(String? url)`
*No documentation provided (generation failed).*
