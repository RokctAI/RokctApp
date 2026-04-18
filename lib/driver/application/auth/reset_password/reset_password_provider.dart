import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/driver/application/auth/reset_password/reset_password_state.dart';
import 'package:rokctapp/driver/application/auth/reset_password/reset_password_notifier.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

final resetPasswordProvider =
    StateNotifierProvider<ResetPasswordNotifier, ResetPasswordState>(
      (ref) => ResetPasswordNotifier(AuthRepository, UserRepository),
    );
