import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/core/domain/di/dependency_manager.dart';
import 'package:rokctapp/driver/application/profile/notifier/profile_image_notifier.dart';
import 'package:rokctapp/driver/application/profile/state/profile_image_state.dart';

final profileImageProvider =
    StateNotifierProvider<ProfileImageNotifier, ProfileImageState>(
      (ref) =>
          ProfileImageNotifier(driverUserRepository, driverSettingsRepository),
    );
