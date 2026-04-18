import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/auth/login/languages/languages_state.dart';
import 'package:rokctapp/manager/application/auth/login/languages/languages_notifier.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

final languagesProvider =
    StateNotifierProvider<LanguagesNotifier, LanguagesState>(
      (ref) => LanguagesNotifier(managerSettingsRepository),
    );
