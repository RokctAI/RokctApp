import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/driver/application/create_product/create_product_notifier.dart';
import 'package:rokctapp/driver/application/create_product/create_product_state.dart';

final createProductProvider =
    StateNotifierProvider<CreateProductNotifier, CreateProductState>(
      (ref) => CreateProductNotifier(),
    );
