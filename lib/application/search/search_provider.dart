import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/application/search/search_notifier.dart';
import 'package:rokctapp/application/search/search_state.dart';

final searchProvider = NotifierProvider<SearchNotifier, SearchState>(
  () => SearchNotifier(),
);
