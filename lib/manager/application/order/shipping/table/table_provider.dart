import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/manager/application/order/shipping/table/table_state.dart';
import 'package:rokctapp/manager/application/order/shipping/table/table_notifier.dart';

final tableProvider = StateNotifierProvider<TableNotifier, TableState>(
  (ref) => TableNotifier(),
);
