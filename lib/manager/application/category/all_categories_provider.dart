import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/category/all_categories_notifier.dart';
import 'package:rokctapp/manager/application/category/all_categories_state.dart';

final allCategoriesProvider =
    StateNotifierProvider<AllCategoriesNotifier, AllCategoriesState>(
      (ref) => AllCategoriesNotifier(),
    );
