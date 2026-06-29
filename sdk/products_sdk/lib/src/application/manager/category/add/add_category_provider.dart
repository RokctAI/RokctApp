import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:products_sdk/src/application/manager/category/add/add_category_state.dart';
import 'package:products_sdk/src/application/manager/category/add/add_category_notifier.dart';
import 'package:core_sdk/core_sdk.dart';

final addCategoryProvider =
    StateNotifierProvider<AddCategoryNotifier, AddCategoryState>(
      (ref) => AddCategoryNotifier(managerCatalogRepository),
    );
