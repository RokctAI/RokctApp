import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/category/add/add_category_state.dart';
import 'package:rokctapp/manager/application/category/add/add_category_notifier.dart';
import 'package:rokctapp/domain/di/dependency_manager.dart';

final addCategoryProvider =
    StateNotifierProvider.autoDispose<AddCategoryNotifier, AddCategoryState>(
      (ref) => AddCategoryNotifier(catalogRepository),
    );
