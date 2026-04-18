import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/main/foods/extras/details/extras_group_details_state.dart';
import 'package:rokctapp/manager/application/main/foods/extras/details/extras_group_details_notifier.dart';
import 'package:rokctapp/manager/domain/di/dependency_manager.dart';

final extrasGroupDetailsProvider =
    StateNotifierProvider<ExtrasGroupDetailsNotifier, ExtrasGroupDetailsState>(
      (ref) => ExtrasGroupDetailsNotifier(productRepository),
    );
