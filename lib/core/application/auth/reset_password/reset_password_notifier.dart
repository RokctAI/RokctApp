import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rokctapp/core/domain/handlers/handlers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';
import 'package:rokctapp/core/infrastructure/utils/services.dart';
import 'package:rokctapp/core/presentation/routes/app_router.dart';
import 'package:rokctapp/manager/presentation/routes/app_router.gr.dart' as manager_routes;
import 'package:rokctapp/driver/presentation/routes/app_router.gr.dart' as driver_routes;

import 'package:rokctapp/core/application/auth/reset_password/reset_password_state.dart';

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
    return AppValidators.isValidEmail(state.email);
  }

  Future<void> sendCodeToNumber(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true, isSuccess: false);
      if (state.email.trim().isEmpty) {
        state = state.copyWith(isLoading: false, isSuccess: false);
        return;
      }
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: state.email.trim(),
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          AppHelpers.showCheckTopSnackBar(
            context,
            AppHelpers.getTranslation(
              AppHelpers.getTranslation(e.message ?? ""),
            ),
          );
          state = state.copyWith(isLoading: false, isSuccess: false);
        },
        codeSent: (String verificationId, int? resendToken) {
          state = state.copyWith(
            phone: state.email,
            isLoading: false,
            verifyId: verificationId,
            isSuccess: true,
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } else {
      if (context.mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> sendCode(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true, isSuccess: false);
      final response = await authRepository.forgotPassword(
        email: state.email.trim(),
      );
      response.when(
        success: (data) async {
          state = state.copyWith(
            verifyId: data.data?.verifyId ?? '',
            isLoading: false,
            isSuccess: true,
          );
        },
        failure: (f, s) {
          state = state.copyWith(
            isLoading: false,
            isEmailError: true,
            isSuccess: false,
          );
          AppHelpers.showCheckTopSnackBar(
            context,
            AppHelpers.getTranslation(status.toString()),
          );
          debugPrint('==> send otp failure: $failure');
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.showCheckTopSnackBar(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }

  Future<void> setResetPassword(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      if (!AppValidators.isValidPassword(state.password)) {
        state = state.copyWith(isPasswordInvalid: true);
        return;
      }
      if (!AppValidators.isValidConfirmPassword(
        state.password,
        state.confirmPassword,
      )) {
        state = state.copyWith(isConfirmPasswordInvalid: true);
        return;
      }
      state = state.copyWith(isLoading: true, isSuccess: false);
      final response = await userRepository.updatePassword(
        password: state.password,
        passwordConfirmation: state.confirmPassword,
      );
      response.when(
        success: (data) async {
          state = state.copyWith(isLoading: false, isSuccess: true);
          final currentFlavor = AppConstants.flavor;
          if (currentFlavor == AppFlavor.manager) {
            context.replaceRoute(const manager_routes.ManagerMainRoute());
          } else if (currentFlavor == AppFlavor.driver) {
            context.replaceRoute(const driver_routes.DriverHomeRoute());
          } else {
            context.replaceRoute(MainRoute());
          }
        },
        failure: (f, s) {
          state = state.copyWith(isLoading: false, isSuccess: false);
          if (s == 400) {
            AppHelpers.showCheckTopSnackBar(
              context,
              AppHelpers.getTranslation(TrKeys.emailIsNotValid),
            );
          } else {
            AppHelpers.showCheckTopSnackBar(context, f);
          }
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }
}
