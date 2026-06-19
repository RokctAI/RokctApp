import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/core/application/select/select_state.dart';
import 'package:rokctapp/core/application/select/select_notifier.dart';

final selectProvider = NotifierProvider<SelectNotifier, SelectState>(
  () => SelectNotifier(),
);
