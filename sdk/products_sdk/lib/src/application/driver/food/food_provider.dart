import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:products_sdk/src/application/driver/food/food_notifier.dart';
import 'package:products_sdk/src/application/driver/food/food_state.dart';

final foodProvider = StateNotifierProvider<FoodNotifier, FoodState>(
  (ref) => FoodNotifier(),
);
