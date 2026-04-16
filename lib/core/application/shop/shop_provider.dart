import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/core/application/shop/shop_notifier.dart';
import 'package:rokctapp/core/application/shop/shop_state.dart';

final shopProvider = NotifierProvider<ShopNotifier, ShopState>(
  () => ShopNotifier(),
);
