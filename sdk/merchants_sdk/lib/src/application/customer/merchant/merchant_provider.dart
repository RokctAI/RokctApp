import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:merchants_sdk/src/application/customer/merchant/merchant_notifier.dart';
import 'package:merchants_sdk/src/application/customer/merchant/merchant_state.dart';

final merchantProvider = NotifierProvider<MerchantNotifier, MerchantState>(
  () => MerchantNotifier(),
);
