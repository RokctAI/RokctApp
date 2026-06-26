import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/core/domain/di/dependency_manager.dart';
import 'package:core_sdk/core_sdk.dart';

final splashProvider = StateNotifierProvider<SplashNotifier, SplashState>(
  (ref) => SplashNotifier(driverSettingsRepository, driverUserRepository),
);
