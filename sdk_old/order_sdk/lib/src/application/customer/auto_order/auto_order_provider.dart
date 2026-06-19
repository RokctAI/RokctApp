import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/customer/application/auto_order/auto_order_state.dart';
import 'package:rokctapp/customer/application/auto_order/auto_order_notifier.dart';

final autoOrderProvider = NotifierProvider<AutoOrderNotifier, AutoOrderState>(
  () => AutoOrderNotifier(),
);
