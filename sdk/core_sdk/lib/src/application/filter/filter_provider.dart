import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:core_sdk/src/application/filter/filter_notifier.dart';
import 'package:core_sdk/src/application/filter/filter_state.dart';

final filterProvider = NotifierProvider<FilterNotifier, FilterState>(
  () => FilterNotifier(),
);

