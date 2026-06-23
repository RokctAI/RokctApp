import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:users_sdk/src/application/customer/customer_profile/profile_notifier.dart';
import 'package:users_sdk/src/application/customer/customer_profile/profile_state.dart';

final profileProvider = NotifierProvider<ProfileNotifier, ProfileState>(
  () => ProfileNotifier(),
);
