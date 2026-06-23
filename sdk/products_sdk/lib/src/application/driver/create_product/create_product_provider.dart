import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:products_sdk/src/application/driver/create_product/create_product_notifier.dart';
import 'package:products_sdk/src/application/driver/create_product/create_product_state.dart';

final createProductProvider =
    StateNotifierProvider<CreateProductNotifier, CreateProductState>(
      (ref) => CreateProductNotifier(),
    );
