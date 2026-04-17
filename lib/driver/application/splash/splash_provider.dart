import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/driver/domain/di/dependency_manager.dart';
import 'package:rokctapp/driver/application/splash/splash_notifier.dart';
import 'package:rokctapp/driver/application/splash/splash_state.dart';

final splashProvider = StateNotifierProvider<SplashNotifier, SplashState>(
  (ref) => SplashNotifier(settingsRepository, userRepository),
);
