import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:core_sdk/src/application/home/home_notifier.dart';
import 'package:core_sdk/src/application/home/home_state.dart';

final homeProvider = NotifierProvider<HomeNotifier, HomeState>(
  () => HomeNotifier(),
);

