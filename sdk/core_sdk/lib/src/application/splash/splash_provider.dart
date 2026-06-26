import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:core_sdk/core_sdk.dart';

final splashProvider = NotifierProvider<SplashNotifier, SplashState>(
  () => SplashNotifier(),
);
