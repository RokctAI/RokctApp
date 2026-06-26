import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:orders_sdk/src/application/manager/orders/appbar/home_appbar_state.dart';
import 'package:orders_sdk/src/application/manager/orders/appbar/home_appbar_notifier.dart';

final homeAppbarProvider =
    StateNotifierProvider<HomeAppbarNotifier, HomeAppbarState>(
      (ref) => HomeAppbarNotifier(),
    );
