import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:products_sdk/src/application/manager/categories/categories_state.dart';
import 'package:products_sdk/src/application/manager/categories/categories_notifier.dart';

final categoriesProvider =
    StateNotifierProvider<CategoriesNotifier, CategoriesState>(
      (ref) => CategoriesNotifier(),
    );
