import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/driver/application/app/app_notifier.dart';
import 'package:rokctapp/driver/application/app/app_state.dart';

final appProvider = StateNotifierProvider<AppNotifier, AppState>(
  (ref) => AppNotifier(),
);
