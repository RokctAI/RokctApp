import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/main/main_state.dart';
import 'package:rokctapp/manager/application/main/main_notifier.dart';

final mainProvider = StateNotifierProvider<MainNotifier, MainState>(
  (ref) => MainNotifier(),
);
