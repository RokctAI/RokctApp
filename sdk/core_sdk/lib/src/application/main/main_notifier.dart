import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:core_sdk/core_sdk.dart';

import 'package:core_sdk/src/application/main/main_state.dart';

class MainNotifier extends Notifier<MainState> {
  @override
  MainState build() => const MainState();

  void selectIndex(int index) {
    state = state.copyWith(selectIndex: index);
  }

  bool checkGuest() {
    return LocalStorage.getToken().isEmpty;
  }

  void changeScrolling(bool isScrolling) {
    state = state.copyWith(isScrolling: isScrolling);
  }
}

