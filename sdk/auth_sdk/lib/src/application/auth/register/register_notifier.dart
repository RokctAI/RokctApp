import 'dart:async';

import 'package:dartz/dartz.dart';

import 'package:flutter/material.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auth_sdk/auth_sdk.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:core_sdk/core_sdk.dart';

import 'package:users_sdk/users_sdk.dart';
import 'package:core_sdk/core_sdk.dart';

import 'register_state.dart';
import '../../auth_providers.dart';

class RegisterNotifier extends Notifier<RegisterState> {
  @override
  RegisterState build() => const RegisterState();

  void setPassword(String password) {
    state = state.copyWith(password: password.trim(), isPasswordInvalid: false);
  }

  void setConfirmPassword(String password) {
    state = state.copyWith(
      confirmPassword: password.trim(),
      isConfirmPasswordInvalid: false,
    );
  }

  void setFirstName(String name) {
    state = state.copyWith(firstName: name.trim());
  }

  void setEmail(String value) {
    state = state.copyWith(email: value.trim(), isEmailInvalid: false);
  }

  void setPhone(String value) {
    state = state.copyWith(phone: value.trim());
  }

  void setLatName(String name) {
    state = state.copyWith(lastName: name.trim());
  }

  void setReferral(String name) {
    state = state.copyWith(referral: name.trim());
  }

  void toggleShowPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }

  void toggleShowConfirmPassword() {
    state = state.copyWith(showConfirmPassword: !state.showConfirmPassword);
  }

  void toggleKeepLogin() {
    state = state.copyWith(isKeepLogin: !state.isKeepLogin);
  }

  void detectLoginType() {
    if (CoreValidators.detectType(state.email) == TrKeys.invalid) {
      state = state.copyWith(isPhoneInvalid: true, isEmailInvalid: true);
    }
  }

  Future<void> getProfileDetails() async {
    final response = await ref.read(userRepositoryProvider).getProfileDetails();
    response.when(
      success: (data) async {
        await ref.read(setUserProvider).call(data.data);
        if (data.data?.wallet != null) {
          await ref.read(setWalletProvider).call(data.data?.wallet);
        }
      },
      failure: (failure, status) {
        debugPrint('==> get profile details failure: $failure');
      },
    );
  }

  bool checkEmail() {
    return CoreValidators.isValidEmail(state.email);
  }

  Future<void> sendCode(BuildContext context, VoidCallback onSuccess) async {
    final connected = await ref.read(connectivityProvider).call();
    if (connected) {
      if (!CoreValidators.isValidEmail(state.email)) {
        state = state.copyWith(isEmailInvalid: true);
        return;
      }
      state = state.copyWith(isLoading: true, isSuccess: false);
      final response = await ref
          .read(authRepositoryProvider)
          .sigUp(email: state.email);
      response.when(
        success: (data) async {
          state = state.copyWith(isLoading: false, isSuccess: true);
          onSuccess();
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false, isSuccess: false);
          if (status == 400) {
            ref
                .read(snackBarProvider)
                .call(
                  context,
                  ref.read(translationProvider).call(TrKeys.emailAlreadyExists),
                );
          } else {
            ref.read(snackBarProvider).call(context, failure);
          }
        },
      );
    } else {
      if (context.mounted) {
        ref.read(noConnectionSnackBarProvider).call(context);
      }
    }
  }

  Future<void> sendCodeToNumber(
    BuildContext context,
    ValueChanged<String> onSuccess,
  ) async {
    final connected = await ref.read(connectivityProvider).call();
    if (connected) {
      state = state.copyWith(isLoading: true, isSuccess: false);
      if (ref.read(isPhoneFirebaseProvider)) {
        ref
            .read(firebaseSendOtpProvider)
            .call(
              phone: state.email,
              onSuccess: (id) {
                state = state.copyWith(
                  verificationId: id,
                  phone: state.email,
                  isLoading: false,
                  isSuccess: true,
                );
                onSuccess(id);
              },
              onError: (r) {
                ref
                    .read(snackBarProvider)
                    .call(context, ref.read(translationProvider).call(r));
                state = state.copyWith(isLoading: false, isSuccess: false);
              },
            );
      } else {
        final response = await ref
            .read(authRepositoryProvider)
            .sendOtp(phone: state.email);
        response.when(
          success: (success) {
            state = state.copyWith(
              verificationId: success.data?.verifyId ?? '',
              phone: state.email,
              isLoading: false,
              isSuccess: true,
            );
            onSuccess(success.data?.verifyId ?? '');
          },
          failure: (failure, status) {
            ref.read(snackBarProvider).call(context, failure);
            state = state.copyWith(isLoading: false, isSuccess: false);
          },
        );
      }
    } else {
      if (context.mounted) {
        ref.read(noConnectionSnackBarProvider).call(context);
      }
    }
  }

  Future<void> register(BuildContext context) async {
    final connected = await ref.read(connectivityProvider).call();
    if (connected) {
      if (!CoreValidators.isValidPassword(state.password)) {
        state = state.copyWith(isPasswordInvalid: true);
        return;
      }
      if (!CoreValidators.isValidConfirmPassword(
        state.password,
        state.confirmPassword,
      )) {
        state = state.copyWith(isConfirmPasswordInvalid: true);
        return;
      }
      state = state.copyWith(isLoading: true);
      final response = await ref
          .read(authRepositoryProvider)
          .sigUpWithData(
            user: UserModel(
              email: state.email,
              firstname: state.firstName,
              lastname: state.lastName,
              phone: state.phone,
              password: state.password,
              confirmPassword: state.confirmPassword,
              referral: state.referral,
            ),
          );
      response.when(
        success: (data) async {
          state = state.copyWith(isLoading: false);
          await ref.read(setTokenProvider).call(data.token ?? '');
          if (ref.read(isTokenExpiredProvider).call()) {
            debugPrint('Token is expired');
          }
          ref.read(authNavigationProvider).call(context, null);
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false);
          ref.read(snackBarProvider).call(context, failure);
        },
      );
    } else {
      if (context.mounted) {
        ref.read(noConnectionSnackBarProvider).call(context);
      }
    }
  }

  Future<void> registerWithFirebase(BuildContext context) async {
    final connected = await ref.read(connectivityProvider).call();
    if (connected) {
      if (!CoreValidators.isValidPassword(state.password)) {
        state = state.copyWith(isPasswordInvalid: true);
        return;
      }
      if (!CoreValidators.isValidConfirmPassword(
        state.password,
        state.confirmPassword,
      )) {
        state = state.copyWith(isConfirmPasswordInvalid: true);
        return;
      }
      state = state.copyWith(isLoading: true);
      final response = await ref
          .read(authRepositoryProvider)
          .sigUpWithPhone(
            user: UserModel(
              email: state.email,
              firstname: state.firstName,
              lastname: state.lastName,
              phone: state.phone,
              password: state.password,
              confirmPassword: state.confirmPassword,
              referral: state.referral,
            ),
          );

      response.when(
        success: (data) async {
          state = state.copyWith(isLoading: false);
          await ref.read(setTokenProvider).call(data.token ?? '');
          if (ref.read(isTokenExpiredProvider).call()) {
            debugPrint('Token is expired');
          }
          ref.read(authNavigationProvider).call(context, data.user);
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false);
          if (status == 400) {
            ref
                .read(snackBarProvider)
                .call(
                  context,
                  ref.read(translationProvider).call(TrKeys.referralIncorrect),
                );
          } else {
            ref.read(snackBarProvider).call(context, failure);
          }
        },
      );
    } else {
      if (context.mounted) {
        ref.read(noConnectionSnackBarProvider).call(context);
      }
    }
  }

  Future<void> registerWithPhone(BuildContext context) async {
    final connected = await ref.read(connectivityProvider).call();
    if (connected) {
      if (!CoreValidators.isValidPassword(state.password)) {
        state = state.copyWith(isPasswordInvalid: true);
        return;
      }
      if (!CoreValidators.isValidConfirmPassword(
        state.password,
        state.confirmPassword,
      )) {
        state = state.copyWith(isConfirmPasswordInvalid: true);
        return;
      }
      state = state.copyWith(isLoading: true);
      final response = await ref
          .read(userRepositoryProvider)
          .editProfile(
            user: EditProfile(
              // email: state.email,
              firstname: state.firstName,
              lastname: state.lastName,
              phone: state.email,
              password: state.password,
              confirmPassword: state.confirmPassword,
              referral: state.referral,
            ),
          );

      response.when(
        success: (data) async {
          state = state.copyWith(isLoading: false);
          ref.read(authNavigationProvider).call(context, null);
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false);
          if (status == 400) {
            ref
                .read(snackBarProvider)
                .call(
                  context,
                  ref
                      .read(translationProvider)
                      .call(
                        ref
                            .read(translationProvider)
                            .call(TrKeys.referralIncorrect),
                      ),
                );
          } else {
            ref.read(snackBarProvider).call(context, failure);
          }
        },
      );
    } else {
      if (context.mounted) {
        ref.read(noConnectionSnackBarProvider).call(context);
      }
    }
  }

  Future<void> loginWithSocial(BuildContext context, dynamic type) async {
    state = state.copyWith(isLoading: true);
    await ref.read(firebaseSocialLoginProvider).call(context, type);
    state = state.copyWith(isLoading: false);
  }
}

typedef Dyn = dynamic;
