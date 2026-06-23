import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

import 'package:products_sdk/src/application/manager/product/products_state.dart';
import 'package:products_sdk/src/application/manager/product/products_notifier.dart';

final productsProvider = StateNotifierProvider<ProductsNotifier, ProductsState>(
  (ref) => ProductsNotifier(managerProductRepository),
);
