import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:auth_sdk/auth_sdk.dart';
import 'package:profile_sdk/profile_sdk.dart';

part 'edit_profile_state.freezed.dart';

@freezed
sealed class EditProfileState with _$EditProfileState {
  const factory EditProfileState({
    @Default(false) bool isLoading,
    @Default(false) bool checked,
    @Default(false) bool isSuccess,
    @Default("") String email,
    @Default("") String firstName,
    @Default("") String lastName,
    @Default("") String phone,
    @Default("") String secondPhone,
    @Default("") String birth,
    @Default("") String gender,
    @Default("") String url,
    @Default("") String imagePath,
    @Default(null) ProfileData? userData,
  }) = _EditProfileState;

  const EditProfileState._();
}
