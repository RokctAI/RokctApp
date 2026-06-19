import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/core/application/currency/currency_notifier.dart';
import 'package:rokctapp/core/application/currency/currency_state.dart';

final currencyProvider = NotifierProvider<CurrencyNotifier, CurrencyState>(
  () => CurrencyNotifier(),
);
