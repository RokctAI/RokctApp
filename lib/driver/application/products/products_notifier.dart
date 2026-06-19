import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/driver/application/products/products_state.dart';

class ProductsNotifier extends StateNotifier<ProductsState> {
  ProductsNotifier() : super(const ProductsState());

  void changeIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }
}
