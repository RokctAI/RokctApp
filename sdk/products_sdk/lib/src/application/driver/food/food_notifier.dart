import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:products_sdk/src/application/driver/food/food_state.dart';

class FoodNotifier extends StateNotifier<FoodState> {
  FoodNotifier() : super(const FoodState());

  void changeToggle(bool toggle) {
    state = state.copyWith(toggle: toggle);
  }

  void changeTimeIndex(int index) {
    state = state.copyWith(timeIndex: index);
  }
}
