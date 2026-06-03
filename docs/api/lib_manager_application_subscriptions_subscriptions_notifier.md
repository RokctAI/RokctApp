# API Reference: subscriptions_notifier

Source file: `lib/manager/application/subscriptions/subscriptions_notifier.dart`

## Classes

### class `SubscriptionNotifier`

## Whitelisted API Endpoints

### `SubscriptionState()); Future<void> fetchSubscriptions({ BuildContext? context, bool? isRefresh, RefreshController? controller, }) async { if (isRefresh ?? false)`
*No documentation provided (generation failed).*

### `payment(BuildContext context, { required VoidCallback onSuccess, VoidCallback? failed, }) async { state = state.copyWith(isPaymentLoading: true); if ((state.payments?[state.selectPayment].tag ?? "") == 'wallet')`
*No documentation provided (generation failed).*

### `onSuccess()); }, failure: (failure, status)`
*No documentation provided (generation failed).*

### `fetchPayments({required BuildContext context}) async { final res = await _paymentsRepo.getPayments(); res.when( success: (data)`
*No documentation provided (generation failed).*

### `selectPayment({required int index})`
*No documentation provided (generation failed).*

### `selectSubscribe({required int index})`
*No documentation provided (generation failed).*
