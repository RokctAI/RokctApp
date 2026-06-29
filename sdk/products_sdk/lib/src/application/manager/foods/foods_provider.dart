import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:products_sdk/src/application/manager/foods/foods_state.dart';
import 'package:products_sdk/src/application/manager/foods/foods_notifier.dart';
import 'package:core_sdk/core_sdk.dart';

final foodsProvider = StateNotifierProvider<FoodsNotifier, FoodsState>(
  (ref) => FoodsNotifier(managerProductRepository),
);
