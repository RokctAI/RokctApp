import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:merchants_sdk/src/application/manager/restaurant/merchant_state.dart';
import 'package:merchants_sdk/src/application/manager/restaurant/restaurant_notifier.dart';
import 'package:core_sdk/core_sdk.dart';

final merchantProvider =
    StateNotifierProvider<MerchantNotifier, MerchantState>(
      (ref) =>
          MerchantNotifier(managerUsersRepository, managerSettingsRepository),
    );
