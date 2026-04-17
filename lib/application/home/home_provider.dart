import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/application/home/home_notifier.dart';
import 'package:rokctapp/application/home/home_state.dart';

final homeProvider = NotifierProvider.autoDispose<HomeNotifier, HomeState>(
  () => HomeNotifier(),
);
