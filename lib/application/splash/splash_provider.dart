import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/application/splash/splash_notifier.dart';
import 'package:rokctapp/application/splash/splash_state.dart';

final splashProvider = NotifierProvider<SplashNotifier, SplashState>(
  () => SplashNotifier(),
);
