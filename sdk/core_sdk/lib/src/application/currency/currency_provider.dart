import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:core_sdk/src/application/currency/currency_notifier.dart';
import 'package:core_sdk/src/application/currency/currency_state.dart';

final currencyProvider = NotifierProvider<CurrencyNotifier, CurrencyState>(
  () => CurrencyNotifier(),
);

