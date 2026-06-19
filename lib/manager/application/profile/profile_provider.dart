import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';
import 'package:rokctapp/manager/application/profile/profile_notifier.dart';
import 'package:rokctapp/manager/application/profile/profile_state.dart';

final profileProvider = StateNotifierProvider<ProfileNotifier, ProfileState>(
  (ref) => ProfileNotifier(
    managerSettingsRepository,
    managerUsersRepository,
    managerShopsRepository,
  ),
);
