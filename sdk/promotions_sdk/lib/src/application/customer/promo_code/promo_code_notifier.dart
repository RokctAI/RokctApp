import 'package:core_sdk/core_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:core_sdk/core_sdk.dart';
import 'package:core_sdk/core_sdk.dart';
import 'package:core_sdk/src/application/promo_code/promo_code_state.dart';

class PromoCodeNotifier extends Notifier<PromoCodeState> {
  @override
  PromoCodeState build() => const PromoCodeState();

  void change(bool isActive) {
    state = state.copyWith(isActive: isActive);
  }

  Future<void> checkPromoCode(
    BuildContext context,
    String promoCode,
    String shopId,
  ) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true, isActive: false);
      final response = await ordersRepository.checkCoupon(
        coupon: promoCode,
        shopId: shopId,
      );
      response.when(
        success: (data) {
          state = state.copyWith(isLoading: false, isActive: true);
        },
        failure: (failure, status) {
          state = state.copyWith(isLoading: false, isActive: false);
        },
      );
    } else {
      if (context.mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }
}

