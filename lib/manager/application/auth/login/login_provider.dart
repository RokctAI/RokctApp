import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/auth/login/login_state.dart';
import 'package:rokctapp/manager/application/auth/login/login_notifier.dart';

final loginProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, LoginState>(
      (ref) => LoginNotifier(),
    );
