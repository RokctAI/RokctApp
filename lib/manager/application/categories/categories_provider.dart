import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/categories/categories_state.dart';
import 'package:rokctapp/manager/application/categories/categories_notifier.dart';

final categoriesProvider =
    StateNotifierProvider<CategoriesNotifier, CategoriesState>(
      (ref) => CategoriesNotifier(),
    );
