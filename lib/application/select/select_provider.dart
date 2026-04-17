import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/application/select/select_state.dart';
import 'package:rokctapp/application/select/select_notifier.dart';

final selectProvider =
    NotifierProvider.autoDispose<SelectNotifier, SelectState>(
      () => SelectNotifier(),
    );
