import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/core/domain/di/dependency_manager.dart';
import 'package:rokctapp/manager/application/main/foods/extras/create/create_extras_group_notifier.dart';
import 'package:rokctapp/manager/application/main/foods/extras/create/create_extras_group_state.dart';

final createExtrasGroupProvider =
    StateNotifierProvider<CreateExtrasGroupNotifier, CreateExtrasGroupState>(
      (ref) => CreateExtrasGroupNotifier(managerProductRepository),
    );
