import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/core/domain/di/dependency_manager.dart';
import 'package:users_sdk/src/application/driver/profile/notifier/profile_edit_notifier.dart';
import 'package:users_sdk/src/application/driver/profile/state/profile_edit_state.dart';

final profileEditProvider =
    StateNotifierProvider<ProfileEditNotifier, ProfileEditState>(
      (ref) => ProfileEditNotifier(driverUserRepository),
    );
