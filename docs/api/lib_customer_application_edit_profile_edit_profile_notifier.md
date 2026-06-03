# API Reference: edit_profile_notifier

Source file: `lib/customer/application/edit_profile/edit_profile_notifier.dart`

## Classes

### class `EditProfileNotifier`

## Whitelisted API Endpoints

### `build() => const EditProfileState(); void setUser(ProfileData user)`
*No documentation provided (generation failed).*

### `setEmail(String email)`
*No documentation provided (generation failed).*

### `setFirstName(String firstName)`
*No documentation provided (generation failed).*

### `setLastName(String lastName)`
*No documentation provided (generation failed).*

### `setPhone(String phone)`
*No documentation provided (generation failed).*

### `setBirth(String birth)`
*No documentation provided (generation failed).*

### `setGender(String gender)`
*No documentation provided (generation failed).*

### `updateProfileImage(context, state.imagePath); } } final response = await userRepository.editProfile( user: EditProfile( firstname: state.firstName.isEmpty ? user.firstname : state.firstName, lastname: state.lastName.isEmpty ? user.lastname : state.lastName, birthday: state.birth.isEmpty ? user.birthday : state.birth, phone: user.phone ?? state.phone, email: state.email.isEmpty ? user.email : state.email, secondPhone: state.secondPhone, images: state.url.isEmpty ? user.img ?? "" : state.url, gender: state.gender.isEmpty ? user.gender : state.gender, ), ); response.when( success: (data)`
*No documentation provided (generation failed).*

### `updateProfileImage(BuildContext context, String path) async { final connected = await AppConnectivity.connectivity(); if (connected)`
*No documentation provided (generation failed).*
