import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/driver/application/push_order/push_order_notifier.dart';
import 'package:rokctapp/driver/application/push_order/push_order_state.dart';

final pushOrderProvider =
    StateNotifierProvider.autoDispose<PushOrderNotifier, PushOrderState>(
      (_) => PushOrderNotifier(),
    );
