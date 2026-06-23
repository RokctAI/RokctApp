import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:products_sdk/src/application/manager/foods/filter/foods_filter_state.dart';
import 'package:products_sdk/src/application/manager/foods/filter/foods_filter_notifier.dart';

final foodsFilterProvider =
    StateNotifierProvider<FoodsFilterNotifier, FoodsFilterState>(
      (ref) => FoodsFilterNotifier(),
    );
