import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:users_sdk/src/application/customer/customer_edit_profile/edit_profile_notifier.dart';
import 'package:users_sdk/src/application/customer/customer_edit_profile/edit_profile_state.dart';

final editProfileProvider =
    NotifierProvider<EditProfileNotifier, EditProfileState>(
      () => EditProfileNotifier(),
    );
