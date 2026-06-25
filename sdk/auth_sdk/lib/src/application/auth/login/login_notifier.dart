import 'package:dartz/dartz.dart';

import 'package:flutter/material.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core_sdk/core_sdk.dart';

import 'package:users_sdk/users_sdk.dart';
import 'package:auth_sdk/auth_sdk.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:core_sdk/core_sdk.dart';

import 'login_state.dart';
import '../../auth_providers.dart';

class LoginNotifier extends Notifier<LoginState> {
  @override
  LoginState build() => const LoginState();

  void setAgreedToTerms(bool agree) {
    state = state.copyWith(isAgreedToTerms: agree);
  }

  void setPassword(String text) {
    state = state.copyWith(
      password: text.trim(),
      isLoginError: false,
      isEmailNotValid: false,
      isPasswordNotValid: false,
    );
  }

  void setEmail(String text) {
    state = state.copyWith(
      email: text.trim(),
      phone: '',
      isLoginError: false,
      isEmailNotValid: false,
      isPasswordNotValid: false,
    );
  }

  void setPhone(String text) {
    state = state.copyWith(
      phone: text.trim(),
      email: '',
      isLoginError: false,
      isEmailNotValid: false,
      isPasswordNotValid: false,
    );
  }

  void setShowPassword(bool show) {
    state = state.copyWith(showPassword: show);
  }

  void setKeepLogin(bool keep) {
    state = state.copyWith(isKeepLogin: keep);
  }

  bool checkEmail() {
    return CoreValidators.isValidEmail(state.email);
  }

  Future<void> checkLanguage(BuildContext context) async {
    final lang = ref.read(getLanguageProvider).call();
    if (lang == null) {
      state = state.copyWith(isSelectLanguage: false);
    } else {
      final connect = await ref.read(connectivityProvider).call();
      if (connect) {
        final response = await ref
            .read(settingsRepositoryProvider)
            .getLanguages();
        response.when(
          success: (data) {
            state = state.copyWith(list: data.data ?? []);
            final List<LanguageData> languages = data.data ?? [];
            for (int i = 0; i < languages.length; i++) {
              if (languages[i].id == lang.id) {
                state = state.copyWith(isSelectLanguage: true);
                break;
              }
            }
          },
          failure: (failure, status) {
            state = state.copyWith(isSelectLanguage: false);
            ref.read(snackBarProvider).call(context, failure);
          },
        );
      } else {
        if (context.mounted) {
          ref.read(noConnectionSnackBarProvider).call(context);
        }
      }
    }
  }

  Future<void> getProfileDetails(BuildContext context) async {
    final response = await ref.read(userRepositoryProvider).getProfileDetails();
    response.when(
      success: (data) async {
        await ref.read(setUserProvider).call(data.data);
      },
      failure: (failure, status) {
        debugPrint('==> get profile details failure: $failure');
      },
    );
  }

  Future<void> login(
    BuildContext context, {
    VoidCallback? checkYourNetwork,
    VoidCallback? loginSuccess,
    VoidCallback? youAreNotDeliveryman,
    VoidCallback? seller,
    VoidCallback? admin,
    VoidCallback? accessDenied,
  }) async {
    final connected = await ref.read(connectivityProvider).call();
    if (connected) {
      if (checkEmail()) {
        if (!CoreValidators.isValidEmail(state.email)) {
          state = state.copyWith(isEmailNotValid: true);
          return;
        }
      }

      if (!CoreValidators.isValidPassword(state.password)) {
        state = state.copyWith(isPasswordNotValid: true);
        return;
      }
      state = state.copyWith(isLoading: true);
      final response = await ref
          .read(authRepositoryProvider)
          .login(
            email: state.email,
            phone: state.phone,
            password: state.password,
          );
      response.when(
        success: (data) async {
          final user = data.data?.user;
          final currentFlavor = ref.read(getFlavorProvider).call();

          // Role-based validation
          if (currentFlavor == 'driver' && user?.role != 'deliveryman') {
            state = state.copyWith(isLoading: false);
            youAreNotDeliveryman?.call();
            return;
          }

          if (currentFlavor == 'manager' &&
              user?.role != 'seller' &&
              user?.role != 'admin') {
            state = state.copyWith(isLoading: false);
            accessDenied?.call();
            return;
          }

          await ref.read(setTokenProvider).call(data.data?.accessToken ?? '');
          if (ref.read(isTokenExpiredProvider).call()) {
            debugPrint('Token is expired');
          }
          await getProfileDetails(context);

          if (currentFlavor == 'manager') {
            if (user?.role == 'seller') seller?.call();
            if (user?.role == 'admin') admin?.call();

            ref
                .read(fetchMyShopProvider)
                .call(
                  afterFetched: () {
                    state = state.copyWith(isLoading: false);
                    loginSuccess?.call();
                    ref.read(authNavigationProvider).call(context, user);
                  },
                );
          } else {
            state = state.copyWith(isLoading: false);
            loginSuccess?.call();
            ref.read(authNavigationProvider).call(context, user);
          }
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false, isLoginError: true);
          ref.read(snackBarProvider).call(context, failure);
        },
      );
    } else {
      if (checkYourNetwork != null) {
        checkYourNetwork();
      } else if (context.mounted) {
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
