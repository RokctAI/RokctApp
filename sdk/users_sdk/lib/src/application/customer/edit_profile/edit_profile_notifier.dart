import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:auth_sdk/auth_sdk.dart';
import 'package:profile_sdk/profile_sdk.dart';
import '../users_providers.dart';
import '../../models/request/edit_profile.dart';
import 'edit_profile_state.dart';

class EditProfileNotifier extends Notifier<EditProfileState> {
  @override
  EditProfileState build() => const EditProfileState();

  void setUser(ProfileData user) {
    state = state.copyWith(
      email: user.email ?? "",
      firstName: user.firstname ?? "",
      lastName: user.lastname ?? "",
      phone: user.phone ?? "",
      secondPhone: user.secondPhone ?? "",
      gender: user.gender ?? "",
      birth: user.birthday ?? "",
    );
  }

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setFirstName(String firstName) {
    state = state.copyWith(firstName: firstName);
  }

  void setLastName(String lastName) {
    state = state.copyWith(lastName: lastName);
  }

  void setPhone(String phone) {
    state = state.copyWith(phone: phone);
  }

  void setSecondPhone(String phone) {
    state = state.copyWith(secondPhone: phone);
  }

  void setBirth(String birth) {
    state = state.copyWith(birth: birth);
  }

  void setGender(String gender) {
    state = state.copyWith(gender: gender);
  }

  Future<void> getPhotoWithUrl(String url) async {
    final file = await ref.read(urlToFileProvider).call(url);
    state = state.copyWith(imagePath: file.path);
  }

  Future<void> getPhoto() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Image Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
          ),
          IOSUiSettings(title: 'Image Cropper', minimumAspectRatio: 1),
        ],
      );
      state = state.copyWith(imagePath: croppedFile?.path ?? "");
    }
  }

  Future<void> editProfile(BuildContext context, ProfileData user) async {
    final connected = await ref.read(connectivityProvider).call();
    if (connected) {
      state = state.copyWith(isLoading: true, isSuccess: false);
      if (state.imagePath.isNotEmpty) {
        if (context.mounted) {
          await updateProfileImage(context, state.imagePath);
        }
      }
      final response = await ref.read(userRepositoryProvider).editProfile(
        user: EditProfile(
          firstname: state.firstName.isEmpty ? user.firstname : state.firstName,
          lastname: state.lastName.isEmpty ? user.lastname : state.lastName,
          birthday: state.birth.isEmpty ? user.birthday : state.birth,
          phone: user.phone ?? state.phone,
          email: state.email.isEmpty ? user.email : state.email,
          secondPhone: state.secondPhone,
          images: state.url.isEmpty ? user.img ?? "" : state.url,
          gender: state.gender.isEmpty ? user.gender : state.gender,
        ),
      );
      response.when(
        success: (data) async {
          await ref.read(setUserProvider).call(data.data);
          if (context.mounted) {
            Navigator.pop(context);
          }
          state = state.copyWith(
            userData: data.data,
            isLoading: false,
            isSuccess: true,
          );
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false);
          ref.read(snackBarProvider).call(
            context,
            ref.read(translationProvider).call(status.toString()),
          );
        },
      );
    } else {
      if (context.mounted) {
        ref.read(snackBarProvider).call(
          context,
          ref.read(translationProvider).call(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }

  Future<void> updateProfileImage(BuildContext context, String path) async {
    final connected = await ref.read(connectivityProvider).call();
    if (connected) {
      String? url;
      final imageResponse = await ref.read(galleryRepositoryProvider).uploadImage(
        path,
        UploadType.users,
      );
      imageResponse.when(
        success: (data) {
          url = data.imageData?.title;
          state = state.copyWith(url: url ?? "");
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false);
          debugPrint('==> upload profile image failure: $failure');
          ref.read(snackBarProvider).call(
            context,
            ref.read(translationProvider).call(status.toString()),
          );
        },
      );
    } else {
      if (context.mounted) {
        state = state.copyWith(isLoading: false);
        ref.read(snackBarProvider).call(
          context,
          ref.read(translationProvider).call(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }
}
