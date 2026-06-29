import 'package:core_sdk/core_sdk.dart';
import 'dart:async';



import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core_sdk/core_sdk.dart';
export 'package:core_sdk/core_sdk.dart';
import 'package:auth_sdk/auth_sdk.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:core_sdk/core_sdk.dart';

import 'register_confirmation_state.dart';
import '../../auth_providers.dart';

class RegisterConfirmationNotifier extends Notifier<RegisterConfirmationState> {
  @override
  RegisterConfirmationState build() => const RegisterConfirmationState();

  Timer? _timer;
  int _initialTime = 30;

  void setCode(String? code) {
    state = state.copyWith(
      confirmCode: code?.trim() ?? '',
      isCodeError: false,
      isConfirm: code.toString().length == 6,
    );
  }

  Future<void> confirmCodeWithPhone({
    required BuildContext context,
    required String verificationId,
    VoidCallback? onSuccess,
  }) async {
    final connected = await ref.read(connectivityProvider).call();
    if (connected) {
      state = state.copyWith(isLoading: true, isSuccess: false);
      if (ref.read(isPhoneFirebaseProvider)) {
        try {
          await ref.read(firebaseVerifyPhoneProvider).call(
            context: context,
            smsCode: state.confirmCode,
            verificationId: state.verificationCode.isNotEmpty
                ? state.verificationCode
                : verificationId,
            onSuccess: () {
              onSuccess?.call();
              state = state.copyWith(
                isLoading: false,
                isSuccess: onSuccess == null ? true : false,
              );
            },
            onError: () {
              state = state.copyWith(
                isLoading: false,
                isCodeError: true,
                isSuccess: false,
              );
            },
          );
        } catch (e) {
          if (context.mounted) {
            ref.read(snackBarProvider).call(context, e.toString());
          }
          state = state.copyWith(
            isLoading: false,
            isCodeError: true,
            isSuccess: false,
          );
        }
      } else {
        state = state.copyWith(isLoading: true, isSuccess: false);
        final response = await ref.read(authRepositoryProvider).verifyPhone(
          verifyCode: state.confirmCode,
          verifyId: state.verificationCode.isNotEmpty
              ? state.verificationCode
              : verificationId,
        );
        response.when(
          success: (data) async {
            state = state.copyWith(isLoading: false, isSuccess: true);
            _timer?.cancel();
            await ref.read(setTokenProvider).call(data.data?.token ?? '');
            LocalStorage.setAddressSelected(
              AddressData(
                title:
                    data.data?.user?.addresses
                        ?.firstWhere(
                          (element) => element.active ?? false,
                          orElse: () {
                            return AddressNewModel();
                          },
                        )
                        .title ??
                    "",
                address:
                    data.data?.user?.addresses
                        ?.firstWhere(
                          (element) => element.active ?? false,
                          orElse: () {
                            return AddressNewModel();
                          },
                        )
                        .address
                        ?.address ??
                    "",
                location: LocationData(
                  longitude: data.data?.user?.addresses
                      ?.firstWhere(
                        (element) => element.active ?? false,
                        orElse: () {
                          return AddressNewModel();
                        },
                      )
                      .location
                      ?.last,
                  latitude: data.data?.user?.addresses
                      ?.firstWhere(
                        (element) => element.active ?? false,
                        orElse: () {
                          return AddressNewModel();
                        },
                      )
                      .location
                      ?.first,
                ),
              ),
            );
            onSuccess?.call();
          },
          failure: (failure, status) {
            state = state.copyWith(
              isLoading: false,
              isCodeError: true,
              isSuccess: false,
            );
            ref.read(snackBarProvider).call(context, failure);
            debugPrint('==> confirm code failure: $failure');
          },
        );
      }
    } else {
      if (context.mounted) {
        ref.read(snackBarProvider).call(
          context,
          ref.read(translationProvider).call(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }

  Future<void> confirmCode(BuildContext context) async {
    final connected = await ref.read(connectivityProvider).call();
    if (connected) {
      state = state.copyWith(isLoading: true, isSuccess: false);
      final response = await ref.read(authRepositoryProvider).verifyEmail(
        verifyCode: state.confirmCode.trim(),
      );
      response.when(
        success: (data) async {
          state = state.copyWith(isLoading: false, isSuccess: true);
          _timer?.cancel();
        },
        failure: (failure, status) {
          state = state.copyWith(
            isLoading: false,
            isCodeError: true,
            isSuccess: false,
          );
          ref.read(snackBarProvider).call(context, failure);
          debugPrint('==> confirm code failure: $failure');
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

  Future<void> confirmCodeResetPassword(
    BuildContext context,
    String email,
  ) async {
    final connected = await ref.read(connectivityProvider).call();
    if (connected) {
      state = state.copyWith(isLoading: true, isResetPasswordSuccess: false);
      final response = await ref.read(authRepositoryProvider).forgotPasswordConfirm(
        verifyCode: state.confirmCode.trim(),
        email: email,
      );
      response.when(
        success: (data) async {
          await LocalStorage.setToken(data.token);
          String? fcmToken = await ref.read(firebaseGetFcmTokenProvider).call();
          await ref.read(userRepositoryProvider).updateFirebaseToken(fcmToken);
          state = state.copyWith(
            isLoading: false,
            isResetPasswordSuccess: true,
          );
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false, isCodeError: true);
          ref.read(snackBarProvider).call(
            context,
            ref.read(translationProvider).call(status.toString()),
          );
          debugPrint('==> confirm reset code failure: $failure');
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

  Future<void> confirmCodeResetPasswordWithPhone(
    BuildContext context,
    String phone,
    String verificationId,
  ) async {
    final connected = await ref.read(connectivityProvider).call();
    if (connected) {
      state = state.copyWith(isLoading: true, isResetPasswordSuccess: false);
      if (ref.read(isPhoneFirebaseProvider)) {
        try {
          await ref.read(firebaseVerifyPhoneProvider).call(
            context: context,
            smsCode: state.confirmCode,
            verificationId: state.verificationCode.isNotEmpty
                ? state.verificationCode
                : verificationId,
            onSuccess: () async {
              final response = await ref.read(authRepositoryProvider).forgotPasswordConfirmWithPhone(
                phone: phone,
              );
              response.when(
                success: (data) async {
                  await ref.read(setTokenProvider).call(data.token ?? '');
                  String? fcmToken = await ref.read(firebaseGetFcmTokenProvider).call();
                  await ref.read(userRepositoryProvider).updateFirebaseToken(fcmToken);
                  state = state.copyWith(
                    isLoading: false,
                    isResetPasswordSuccess: true,
                  );
                },
                failure: (failure, status) {
                  state = state.copyWith(isLoading: false, isCodeError: true);
                  ref.read(snackBarProvider).call(
                    context,
                    ref.read(translationProvider).call(status.toString()),
                  );
                  debugPrint('==> confirm reset code failure: $failure');
                },
              );
            },
            onError: () {
              state = state.copyWith(isLoading: false, isCodeError: true);
            },
          );
        } catch (e) {
          if (context.mounted) {
            ref.read(snackBarProvider).call(context, e.toString());
          }
          state = state.copyWith(isLoading: false, isCodeError: true);
        }
      } else {
        state = state.copyWith(isLoading: true, isResetPasswordSuccess: false);
        final response = await ref.read(authRepositoryProvider).verifyPhone(
          verifyCode: state.confirmCode,
          verifyId: state.verificationCode.isNotEmpty
              ? state.verificationCode
              : verificationId,
        );
        response.when(
          success: (data) async {
            state = state.copyWith(
              isLoading: false,
              isResetPasswordSuccess: true,
            );
            _timer?.cancel();
            await ref.read(setTokenProvider).call(data.data?.token ?? '');
            LocalStorage.setAddressSelected(
              AddressData(
                title:
                    data.data?.user?.addresses
                        ?.firstWhere(
                          (element) => element.active ?? false,
                          orElse: () {
                            return AddressNewModel();
                          },
                        )
                        .title ??
                    "",
                address:
                    data.data?.user?.addresses
                        ?.firstWhere(
                          (element) => element.active ?? false,
                          orElse: () {
                            return AddressNewModel();
                          },
                        )
                        .address
                        ?.address ??
                    "",
                location: LocationData(
                  longitude: data.data?.user?.addresses
                      ?.firstWhere(
                        (element) => element.active ?? false,
                        orElse: () {
                          return AddressNewModel();
                        },
                      )
                      .location
                      ?.last,
                  latitude: data.data?.user?.addresses
                      ?.firstWhere(
                        (element) => element.active ?? false,
                        orElse: () {
                          return AddressNewModel();
                        },
                      )
                      .location
                      ?.first,
                ),
              ),
            );
          },
          failure: (failure, status) {
            state = state.copyWith(
              isLoading: false,
              isCodeError: true,
              isResetPasswordSuccess: false,
            );
            ref.read(snackBarProvider).call(context, failure);
            debugPrint('==> confirm code failure: $failure');
          },
        );
      }
    } else {
      if (context.mounted) {
        ref.read(snackBarProvider).call(
          context,
          ref.read(translationProvider).call(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }

  Future<void> resendConfirmation(
    BuildContext context,
    String email, {
    bool isResetPassword = false,
  }) async {
    final connected = await ref.read(connectivityProvider).call();
    if (connected) {
      state = state.copyWith(isResending: true);
      late ApiResult<dynamic> response;
      if (isResetPassword) {
        response = await ref.read(authRepositoryProvider).forgotPassword(email: email.trim());
      } else {
        response = await ref.read(authRepositoryProvider).sigUp(email: email.trim());
      }

      response.when(
        success: (data) async {
          state = state.copyWith(isResending: false);
        },
        failure: (failure, status) {
          state = state.copyWith(isResending: false);
          ref.read(snackBarProvider).call(
            context,
            ref.read(translationProvider).call(status.toString()),
          );
          debugPrint('==> send otp failure: $failure');
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

  Future<void> sendCodeToNumber(
    BuildContext context,
    String phoneNumber,
  ) async {
    final connected = await ref.read(connectivityProvider).call();
    if (connected) {
      state = state.copyWith(isResending: true);
      if (ref.read(isPhoneFirebaseProvider)) {
        
      ref.read(firebaseSendOtpProvider).call(
        phone: phoneNumber,
        onSuccess: (verificationId) {
          state = state.copyWith(
            isResending: false,
            verificationCode: verificationId,
          );
        },
        onError: (e) {
          ref.read(snackBarProvider).call(context, ref.read(translationProvider).call(e));
          state = state.copyWith(isResending: false);
        },
      );
      if (false) //
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {
            ref.read(snackBarProvider).call(
              context,
              ref.read(translationProvider).call(e.message ?? ""),
            );
            state = state.copyWith(isResending: false);
          },
          codeSent: (String verificationId, int? resendToken) {
            state = state.copyWith(
              isResending: false,
              verificationCode: verificationId,
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      } else {
        final response = await ref.read(authRepositoryProvider).sendOtp(phone: phoneNumber);
        response.when(
          success: (success) {
            state = state.copyWith(
              isResending: false,
              verificationCode: success.data?.verifyId ?? '',
            );
          },
          failure: (failure, status) {
            ref.read(snackBarProvider).call(context, failure);
            state = state.copyWith(isResending: false);
          },
        );
      }
    } else {
      if (context.mounted) {
        ref.read(noConnectionSnackBarProvider).call(context);
      }
    }
  }

  Future<void> resendResetConfirmation(
    BuildContext context,
    String phoneNumber,
  ) async {
    final connected = await ref.read(connectivityProvider).call();
    if (connected) {
      state = state.copyWith(isResending: true);
      if (ref.read(isPhoneFirebaseProvider)) {
        
      ref.read(firebaseSendOtpProvider).call(
        phone: phoneNumber,
        onSuccess: (verificationId) {
          state = state.copyWith(
            isResending: false,
            verificationCode: verificationId,
          );
        },
        onError: (e) {
          ref.read(snackBarProvider).call(context, ref.read(translationProvider).call(e));
          state = state.copyWith(isResending: false);
        },
      );
      if (false) //
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {
            ref.read(snackBarProvider).call(
              context,
              ref.read(translationProvider).call(e.message ?? ""),
            );
            state = state.copyWith(isResending: false);
          },
          codeSent: (String verificationId, int? resendToken) {
            state = state.copyWith(
              isResending: false,
              verificationCode: verificationId,
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      } else {
        final response = await ref.read(authRepositoryProvider).forgotPassword(
          email: phoneNumber,
        );
        response.when(
          success: (success) {
            state = state.copyWith(
              isResending: false,
              verificationCode: success.data?.verifyId ?? '',
            );
          },
          failure: (failure, status) {
            ref.read(snackBarProvider).call(context, failure);
            state = state.copyWith(isResending: false);
          },
        );
      }
    } else {
      if (context.mounted) {
        ref.read(noConnectionSnackBarProvider).call(context);
      }
    }
  }

  void disposeTimer() {
    _timer?.cancel();
  }

  void startTimer() {
    _timer?.cancel();
    _initialTime = 30;
    state = state.copyWith(confirmCode: '', isCodeError: false);
    if (_timer != null) {
      _initialTime = 30;
      _timer?.cancel();
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_initialTime < 1) {
        _timer?.cancel();
        state = state.copyWith(isTimeExpired: true);
      } else {
        _initialTime--;
        state = state.copyWith(
          isTimeExpired: false,
          timerText: formatHHMMSS(_initialTime),
        );
      }
    });
  }

  void cancelTimer() {
    _timer?.cancel();
  }

  String formatHHMMSS(int seconds) {
    seconds = (seconds % 3600).truncate();
    int minutes = (seconds / 60).truncate();
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    return "$minutesStr:$secondsStr";
  }
}

