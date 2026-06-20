import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'payments_state.dart';
import 'payments_provider.dart';

class PaymentNotifier extends Notifier<PaymentState> {
  @override
  PaymentState build() => const PaymentState();

  void change(int index) {
    state = state.copyWith(currentIndex: index);
  }

  Future<void> fetchPayments(
    BuildContext context, {
    bool withOutCash = false,
  }) async {
    final connected = await ref.read(connectivityProvider).call();
    if (connected) {
      state = state.copyWith(isPaymentsLoading: true);
      final response = await ref.read(paymentsRepositoryProvider).getPayments();
      response.when(
        success: (data) {
          List payments = [];
          if (withOutCash) {
            payments =
                data.data?.reversed.where((e) => e.tag != "cash").toList() ??
                [];
          } else {
            payments = data.data?.reversed.toList() ?? [];
          }
          state = state.copyWith(payments: payments, isPaymentsLoading: false);
        },
        failure: (failure, status) {
          state = state.copyWith(isPaymentsLoading: false);
          ref.read(snackBarProvider).call(
            context,
            ref.read(translationProvider).call(status.toString()),
          );
        },
      );
    } else {
      if (context.mounted) {
        ref.read(noConnectionSnackBarProvider).call(context);
      }
    }
  }
}
