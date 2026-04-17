import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/application/floating_button/floating_state.dart';

class FloatingNotifier extends Notifier<FloatingState> {
  @override
  FloatingState build() => const FloatingState();

  void changeScrolling(bool isScrolling) {
    state = state.copyWith(isScrolling: isScrolling);
  }
}
