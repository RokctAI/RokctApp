import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:merchants_sdk/src/application/manager/subscriptions/subscriptions_provider.dart';
import 'package:merchants_sdk/src/infrastructure/services/app_helpers.dart';
import 'package:merchants_sdk/src/infrastructure/services/local_storage.dart';
import 'package:merchants_sdk/src/infrastructure/services/tr_keys.dart';
import 'package:merchants_sdk/src/presentation/component/buttons/custom_button.dart';
import 'package:${package}/core/presentation/theme/theme.dart';

class PaymentDialog extends ConsumerWidget {
  const PaymentDialog({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(subscriptionProvider);
    final notifier = ref.read(subscriptionProvider.notifier);
    final isLrt = LocalStorage.getLangLtr();
    return Directionality(
      textDirection: isLrt ? TextDirection.ltr : TextDirection.rtl,
      child: SizedBox(
        height: (state.payments?.length ?? 0) > 8
            ? MediaQuery.sizeOf(context).height / 1.6
            : MediaQuery.sizeOf(context).height / 2,
        width: MediaQuery.sizeOf(context).width / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppHelpers.getTranslation(TrKeys.selectPayment)),
            // @subscription-payments-list
            
            // @subscription-payments-action
          ],
        ),
      ),
    );
  }
}

