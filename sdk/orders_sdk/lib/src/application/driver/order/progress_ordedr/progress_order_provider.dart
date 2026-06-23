import 'package:orders_sdk/src/application/driver/order/progress_ordedr/progress_order_notifier.dart';
import 'package:orders_sdk/src/application/driver/order/progress_ordedr/progress_order_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final progressOrderProvider =
    StateNotifierProvider<ProgressOrderNotifier, ProgressOrderState>(
      (ref) => ProgressOrderNotifier(),
    );
