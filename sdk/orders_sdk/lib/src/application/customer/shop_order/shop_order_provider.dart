import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:orders_sdk/src/application/customer/shop_order/shop_order_notifier.dart';
import 'package:orders_sdk/src/application/customer/shop_order/shop_order_state.dart';

final shopOrderProvider = NotifierProvider<ShopOrderNotifier, ShopOrderState>(
  () => ShopOrderNotifier(),
);
