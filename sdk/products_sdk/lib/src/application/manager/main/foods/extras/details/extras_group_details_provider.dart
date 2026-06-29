import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:products_sdk/src/application/manager/main/foods/extras/details/extras_group_details_state.dart';
import 'package:products_sdk/src/application/manager/main/foods/extras/details/extras_group_details_notifier.dart';
import 'package:core_sdk/core_sdk.dart';

final extrasGroupDetailsProvider =
    StateNotifierProvider<ExtrasGroupDetailsNotifier, ExtrasGroupDetailsState>(
      (ref) => ExtrasGroupDetailsNotifier(managerProductRepository),
    );
