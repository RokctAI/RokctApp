import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rokctapp/core/domain/di/dependency_manager.dart';
import 'package:rokctapp/core/infrastructure/utils/app_helpers.dart';
import 'package:rokctapp/core/infrastructure/utils/local_storage.dart';
import 'package:rokctapp/core/presentation/routes/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:subscriptions_sdk/subscriptions_sdk.dart' as sdk;

final subscriptionProvider = sdk.subscriptionProvider.overrideWith((ref) {
  return sdk.SubscriptionNotifier(
    managerSubscriptionRepository,
    managerPaymentRepositoryNew,
    getWalletPrice: () => LocalStorage.getUser()?.wallet?.price ?? 0,
    onNavigateToWebView: (context, url) async {
      await context.pushRoute(ManagerWebViewRoute(url: url));
    },
    onError: (context, message) {
      AppHelpers.errorSnackBar(context, text: message);
    },
    getTranslation: (key) => AppHelpers.getTranslation(key),
  );
});
final managerSubscriptionProvider = subscriptionProvider;
