import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/core/application/filter/filter_notifier.dart';
import 'package:rokctapp/core/application/filter/filter_state.dart';

final filterProvider = NotifierProvider<FilterNotifier, FilterState>(
  () => FilterNotifier(),
);
