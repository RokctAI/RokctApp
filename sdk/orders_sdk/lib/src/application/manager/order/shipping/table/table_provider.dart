import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:orders_sdk/src/application/manager/order/shipping/table/table_state.dart';
import 'package:orders_sdk/src/application/manager/order/shipping/table/table_notifier.dart';

final tableProvider = StateNotifierProvider<TableNotifier, TableState>(
  (ref) => TableNotifier(),
);
