import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/foods/filter/foods_filter_state.dart';
import 'package:rokctapp/manager/application/foods/filter/foods_filter_notifier.dart';

final foodsFilterProvider =
    StateNotifierProvider<FoodsFilterNotifier, FoodsFilterState>(
      (ref) => FoodsFilterNotifier(),
    );
