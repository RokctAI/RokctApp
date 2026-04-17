import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/customer/application/filter/filter_notifier.dart';
import 'package:rokctapp/customer/application/filter/filter_state.dart';

final filterProvider =
    NotifierProvider.autoDispose<FilterNotifier, FilterState>(
      () => FilterNotifier(),
    );
