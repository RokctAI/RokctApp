import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokctapp/manager/application/auth/reset_password/reset_password_notifier.dart';
import 'package:rokctapp/manager/application/auth/reset_password/reset_password_state.dart';

final resetPasswordProvider =
    StateNotifierProvider.autoDispose<
      ResetPasswordNotifier,
      ResetPasswordState
    >((ref) => ResetPasswordNotifier());
