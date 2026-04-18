import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/splash/splash_state.dart';
import 'package:rokctapp/manager/application/splash/splash_notifier.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

final splashProvider =
    StateNotifierProvider.autoDispose<SplashNotifier, SplashState>(
      (ref) => SplashNotifier(managerSettingsRepository, managerUsersRepository),
    );
