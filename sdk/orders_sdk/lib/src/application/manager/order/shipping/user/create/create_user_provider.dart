import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:core_sdk/core_sdk.dart';
import 'package:orders_sdk/src/application/manager/order/shipping/user/create/create_user_notifier.dart';
import 'package:orders_sdk/src/application/manager/order/shipping/user/create/create_user_state.dart';

final createUserProvider =
    StateNotifierProvider<CreateUserNotifier, CreateUserState>(
      (ref) => CreateUserNotifier(managerUsersRepository),
    );
