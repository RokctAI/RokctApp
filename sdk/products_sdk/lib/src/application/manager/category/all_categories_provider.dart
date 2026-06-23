import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:products_sdk/src/application/manager/category/all_categories_notifier.dart';
import 'package:products_sdk/src/application/manager/category/all_categories_state.dart';

final allCategoriesProvider =
    StateNotifierProvider<AllCategoriesNotifier, AllCategoriesState>(
      (ref) => AllCategoriesNotifier(),
    );
