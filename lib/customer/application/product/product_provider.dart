import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/customer/application/product/product_notifier.dart';
import 'package:rokctapp/customer/application/product/product_state.dart';

final productProvider =
    NotifierProvider.autoDispose<ProductNotifier, ProductState>(
      () => ProductNotifier(),
    );
