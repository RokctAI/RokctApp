import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/driver/application/create_product/create_product_state.dart';

class CreateProductNotifier extends AutoDisposeNotifier<CreateProductState> {
  CreateProductNotifier() : super(const CreateProductState());

  void changeIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }
}
