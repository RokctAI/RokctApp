import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/application/edit_profile/edit_profile_notifier.dart';
import 'package:rokctapp/application/edit_profile/edit_profile_state.dart';

final editProfileProvider =
    NotifierProvider<EditProfileNotifier, EditProfileState>(
      () => EditProfileNotifier(),
    );
