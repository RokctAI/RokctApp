import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/main/foods/extras/update/update_extras_group_state.dart';
import 'package:rokctapp/manager/application/main/foods/extras/update/update_extras_group_notifier.dart';
import 'package:venderfoodyman/domain/di/dependency_manager.dart';

final updateExtrasGroupProvider =
    StateNotifierProvider<UpdateExtrasGroupNotifier, UpdateExtrasGroupState>(
      (ref) => UpdateExtrasGroupNotifier(productRepository),
    );
