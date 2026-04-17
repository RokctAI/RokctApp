import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/application/promo_code/promo_code_notifier.dart';
import 'package:rokctapp/application/promo_code/promo_code_state.dart';

final promoCodeProvider = NotifierProvider<PromoCodeNotifier, PromoCodeState>(
  () => PromoCodeNotifier(),
);
