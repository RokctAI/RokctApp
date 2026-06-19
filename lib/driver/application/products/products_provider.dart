import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/driver/application/products/products_notifier.dart';
import 'package:rokctapp/driver/application/products/products_state.dart';

final productsProvider = StateNotifierProvider<ProductsNotifier, ProductsState>(
  (ref) => ProductsNotifier(),
);
