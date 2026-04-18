import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokctapp/manager/domain/di/dependency_manager.dart';

import 'package:rokctapp/manager/application/product/products_state.dart';
import 'package:rokctapp/manager/application/product/products_notifier.dart';

final productsProvider = StateNotifierProvider<ProductsNotifier, ProductsState>(
  (ref) => ProductsNotifier(productRepository),
);
