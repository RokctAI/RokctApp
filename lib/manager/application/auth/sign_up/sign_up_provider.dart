import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/auth/sign_up/sign_up_state.dart';
import 'package:rokctapp/manager/application/auth/sign_up/sign_up_notifier.dart';
import 'package:venderfoodyman/domain/di/dependency_manager.dart';

final signUpProvider =
    StateNotifierProvider.autoDispose<SignUpNotifier, SignUpState>(
      (ref) => SignUpNotifier(authRepository, usersRepository),
    );
