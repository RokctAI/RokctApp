import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:core_sdk/core_sdk.dart';
import 'package:users_sdk/src/application/driver/profile/notifier/profile_image_notifier.dart';
import 'package:users_sdk/src/application/driver/profile/state/profile_image_state.dart';

final profileImageProvider =
    StateNotifierProvider<ProfileImageNotifier, ProfileImageState>(
      (ref) =>
          ProfileImageNotifier(driverUserRepository, driverSettingsRepository),
    );
