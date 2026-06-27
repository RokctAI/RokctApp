import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/core/application/app/app_notifier.dart';
import 'package:rokctapp/core/application/app/app_state.dart';

final appProvider = NotifierProvider<AppNotifier, AppState>(
  () => AppNotifier(),
);
