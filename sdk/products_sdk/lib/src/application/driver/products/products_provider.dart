import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:products_sdk/src/application/driver/products/products_notifier.dart';
import 'package:products_sdk/src/application/driver/products/products_state.dart';

final productsProvider = StateNotifierProvider<ProductsNotifier, ProductsState>(
  (ref) => ProductsNotifier(),
);
