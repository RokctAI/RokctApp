import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokctapp/customer/application/profile/profile_notifier.dart';
import 'package:rokctapp/customer/application/profile/profile_state.dart';

final profileProvider = NotifierProvider<ProfileNotifier, ProfileState>(
  () => ProfileNotifier(),
);
