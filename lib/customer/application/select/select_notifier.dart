import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokctapp/customer/application/select/select_state.dart';

class SelectNotifier extends Notifier<SelectState> {
  @override
  SelectState build() => const SelectState();

  void selectIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }
}
