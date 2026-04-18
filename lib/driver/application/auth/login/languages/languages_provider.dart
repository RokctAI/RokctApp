import 'package:rokctapp/core/domain/di/dependency_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/driver/application/auth/login/languages/languages_notifier.dart';
import 'package:rokctapp/driver/application/auth/login/languages/languages_state.dart';

final languagesProvider =
    StateNotifierProvider<LanguageNotifier, LanguageState>(
      (ref) => LanguageNotifier(driverSettingsRepository),
    );
