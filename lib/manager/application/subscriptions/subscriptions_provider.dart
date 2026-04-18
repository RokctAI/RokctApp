import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';

import 'package:rokctapp/manager/application/subscriptions/subscriptions_state.dart';
import 'package:rokctapp/manager/application/subscriptions/subscriptions_notifier.dart';

final subscriptionProvider =
    StateNotifierProvider<SubscriptionNotifier, SubscriptionState>(
      (ref) =>
          SubscriptionNotifier(managerSubscriptionRepository, managerPaymentRepositoryNew),
    );
