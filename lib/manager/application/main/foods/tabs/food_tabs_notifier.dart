import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/main/foods/tabs/food_tabs_state.dart';

class FoodTabsNotifier extends AutoDisposeNotifier<FoodTabsState> {
  FoodTabsNotifier() : super(const FoodTabsState());

  void setSelectedIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }
}
