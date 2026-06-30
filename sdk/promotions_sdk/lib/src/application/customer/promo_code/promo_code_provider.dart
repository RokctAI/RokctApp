import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:core_sdk/src/application/promo_code/promo_code_notifier.dart';
import 'package:core_sdk/src/application/promo_code/promo_code_state.dart';

final promoCodeProvider = NotifierProvider<PromoCodeNotifier, PromoCodeState>(
  () => PromoCodeNotifier(),
);

