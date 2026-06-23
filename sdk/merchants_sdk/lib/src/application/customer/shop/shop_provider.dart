import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:merchants_sdk/src/application/customer/shop/shop_notifier.dart';
import 'package:merchants_sdk/src/application/customer/shop/shop_state.dart';

final shopProvider = NotifierProvider<ShopNotifier, ShopState>(
  () => ShopNotifier(),
);
