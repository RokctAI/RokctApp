import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:core_sdk/src/application/select/select_state.dart';
import 'package:core_sdk/src/application/select/select_notifier.dart';

final selectProvider = NotifierProvider<SelectNotifier, SelectState>(
  () => SelectNotifier(),
);

