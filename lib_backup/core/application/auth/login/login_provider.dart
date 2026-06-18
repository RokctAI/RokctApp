import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/core/application/auth/login/login_notifier.dart';
import 'package:rokctapp/core/application/auth/login/login_state.dart';

final loginProvider = NotifierProvider<LoginNotifier, LoginState>(
  () => LoginNotifier(),
);
