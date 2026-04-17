import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/application/auth/reset_password/reset_password_notifier.dart';
import 'package:rokctapp/application/auth/reset_password/reset_password_state.dart';

final resetPasswordProvider =
    NotifierProvider<ResetPasswordNotifier, ResetPasswordState>(
      () => ResetPasswordNotifier(),
    );
