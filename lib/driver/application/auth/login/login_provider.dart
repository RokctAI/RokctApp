import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/driver/domain/di/dependency_manager.dart';
import 'package:rokctapp/driver/application/auth/login/login_notifier.dart';
import 'package:rokctapp/driver/application/auth/login/login_state.dart';

final loginProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, LoginState>(
      (ref) => LoginNotifier(authRepository, userRepository),
    );
