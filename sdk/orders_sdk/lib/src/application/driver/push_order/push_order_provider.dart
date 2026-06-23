import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:orders_sdk/src/application/driver/push_order/push_order_notifier.dart';
import 'package:orders_sdk/src/application/driver/push_order/push_order_state.dart';

final pushOrderProvider =
    StateNotifierProvider<PushOrderNotifier, PushOrderState>(
      (_) => PushOrderNotifier(),
    );
