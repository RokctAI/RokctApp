import 'dart:async';

import 'package:flutter/material.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:core_sdk/core_sdk.dart';

import 'package:users_sdk/users_sdk.dart';
import 'reset_password_state.dart';
import '../../auth_providers.dart';

class ResetPasswordNotifier extends Notifier<ResetPasswordState> {
  @override
  ResetPasswordState build() => const ResetPasswordState();

  void setEmail(String text) {
    state = state.copyWith(email: text.trim(), isEmailError: false);
  }

  void setVerifyId(String? value) {
    state = state.copyWith(verifyId: value?.trim() ?? '');
  }

  void setPassword(String password) {
    state = state.copyWith(password: password.trim(), isPasswordInvalid: false);
  }

  void setConfirmPassword(String password) {
    state = state.copyWith(
      confirmPassword: password.trim(),
      isConfirmPasswordInvalid: false,
    );
  }

  void toggleShowPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }

  void toggleShowConfirmPassword() {
    state = state.copyWith(showConfirmPassword: !state.showConfirmPassword);
  }

  bool checkEmail() {
    return CoreValidators.isValidEmail(state.email);
  }

  Future<void> sendCodeToNumber(BuildContext context) async {
    final connected = await ref.read(connectivityProvider).call();
    if (connected) {
      state = state.copyWith(isLoading: true, isSuccess: false);
      if (state.email.trim().isEmpty) {
        state = state.copyWith(isLoading: false, isSuccess: false);
        return;
      }
      await ref
          .read(firebaseSendOtpProvider)
          .call(
            phone: state.email.trim(),
            onSuccess: (verificationId) {
              state = state.copyWith(
                phone: state.email,
                isLoading: false,
                verifyId: verificationId,
                isSuccess: true,
              );
            },
            onError: (e) {
              ref
                  .read(snackBarProvider)
                  .call(context, ref.read(translationProvider).call(e));
              state = state.copyWith(isLoading: false, isSuccess: false);
            },
          );
    } else {
      if (context.mounted) {
        ref.read(noConnectionSnackBarProvider).call(context);
      }
    }
  }

  Future<void> sendCode(BuildContext context) async {
    final connected = await ref.read(connectivityProvider).call();
    if (connected) {
      state = state.copyWith(isLoading: true, isSuccess: false);
      final response = await ref
          .read(authRepositoryProvider)
          .forgotPassword(email: state.email.trim());
      response.when(
        success: (data) async {
          state = state.copyWith(
            verifyId: data.data?.verifyId ?? '',
            isLoading: false,
            isSuccess: true,
          );
        },
        failure: (failure, status) {
          state = state.copyWith(
            isLoading: false,
            isEmailError: true,
            isSuccess: false,
          );
          ref
              .read(snackBarProvider)
              .call(
                context,
                ref.read(translationProvider).call(status.toString()),
              );
          debugPrint('==> send otp failure: $failure');
        },
      );
    } else {
      if (context.mounted) {
        ref
            .read(snackBarProvider)
            .call(
              context,
              ref
                  .read(translationProvider)
                  .call(TrKeys.checkYourNetworkConnection),
            );
      }
    }
  }

  Future<void> setResetPassword(
    BuildContext context, {
    required void Function() onSuccess,
  }) async {
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
      state = state.copyWith(isLoading: true, isSuccess: false);
      final response = await ref
          .read(userRepositoryProvider)
          .updatePassword(
            password: state.password,
            passwordConfirmation: state.confirmPassword,
          );
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
                  ref.read(translationProvider).call(TrKeys.emailIsNotValid),
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
}
