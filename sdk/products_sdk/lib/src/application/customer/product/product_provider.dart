import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:products_sdk/src/application/customer/product/product_notifier.dart';
import 'package:products_sdk/src/application/customer/product/product_state.dart';

final productProvider = NotifierProvider<ProductNotifier, ProductState>(
  () => ProductNotifier(),
);
