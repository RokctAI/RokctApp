import 'package:flutter/material.dart';
import 'package:rokctapp/core/domain/handlers/handlers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

import 'package:rokctapp/manager/application/auth/login/login_state.dart';
import 'package:rokctapp/manager/infrastructure/services/services.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  String _email = '';
  String _password = '';

  LoginNotifier() : super(const LoginState());

  Future<void> getProfileDetails() async {
    final response = await managerUsersRepository.getProfileDetails();
    response.when(
      success: (data) {
        LocalStorage.setUser(data.data);
        if (data.data?.wallet != null) {
          LocalStorage.setWallet(data.data?.wallet);
        }
      },
      failure: (f, s) {
        debugPrint('==> get profile details failure: $failure');
      },
    );
  }

  void setPassword(String text) {
    _password = text.trim();
    if (state.isLoginError) {
      state = state.copyWith(isLoginError: false);
    }
  }

  void setEmail(String text) {
    _email = text.trim();
    if (state.isLoginError) {
      state = state.copyWith(isLoginError: false);
    }
  }

  void toggleShowPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }

  void toggleKeepLogin() {
    state = state.copyWith(isKeepLogin: !state.isKeepLogin);
  }

  Future<void> login({
    VoidCallback? checkYourNetwork,
    VoidCallback? loginSuccess,
    VoidCallback? seller,
    VoidCallback? admin,
    VoidCallback? accessDenied,
    required int index,
  }) async {
    if (await AppConnectivity.connectivity()) {
      state = state.copyWith(isLoading: true);
      final response = await managerAuthRepository.login(
        email: _email,
        password: _password,
      );
      response.when(
        success: (data) async {
          if (data.data?.user?.role == 'seller') {
            seller?.call();
          } else if (data.data?.user?.role == 'admin') {
            state = state.copyWith(isLoading: false);
            accessDenied?.call();
          } else {
            state = state.copyWith(isLoading: false);
            accessDenied?.call();
          }
          LocalStorage.setToken(data.data?.accessToken ?? '');
          loginSuccess?.call();
          getProfileDetails();
          String? fcmToken;
          try {
            fcmToken = await FirebaseMessaging.instance.getToken();
          } catch (e) {
            debugPrint('===> error with getting firebase token $e');
          }
          managerUsersRepository.updateFirebaseToken(fcmToken);
          state = state.copyWith(isLoading: false);
        },
        failure: (f, s) {
          debugPrint('===> login request failure $failure');
          state = state.copyWith(isLoading: false, isLoginError: true);
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }
}
