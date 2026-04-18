import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rokctapp/core/domain/di/dependency_manager.dart';
import 'package:rokctapp/manager/application/order/shipping/user/create/create_user_notifier.dart';
import 'package:rokctapp/manager/application/order/shipping/user/create/create_user_state.dart';

final createUserProvider =
    StateNotifierProvider.autoDispose<CreateUserNotifier, CreateUserState>(
      (ref) => CreateUserNotifier(managerUsersRepository),
    );
