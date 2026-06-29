import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:core_sdk/core_sdk.dart';
import 'package:users_sdk/src/application/driver/profile/notifier/profile_settings_notifier.dart';
import 'package:users_sdk/src/application/driver/profile/state/profile_settings_state.dart';

final profileSettingsProvider =
    StateNotifierProvider<ProfileSettingsNotifier, ProfileSettingsState>(
      (ref) => ProfileSettingsNotifier(driverUserRepository),
    );
