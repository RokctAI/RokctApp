import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:core_sdk/core_sdk.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

final splashProvider = StateNotifierProvider<SplashNotifier, SplashState>(
  (ref) => SplashNotifier(managerSettingsRepository, managerUsersRepository),
);
