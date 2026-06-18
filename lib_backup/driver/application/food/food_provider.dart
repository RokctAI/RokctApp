import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/driver/application/food/food_notifier.dart';
import 'package:rokctapp/driver/application/food/food_state.dart';

final foodProvider = StateNotifierProvider<FoodNotifier, FoodState>(
  (ref) => FoodNotifier(),
);
