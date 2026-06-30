import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';
import 'package:core_sdk/core_sdk.dart';
import '../../core/polaris_sdk_core.dart';
import 'package:polaris_sdk/src/models/customer/polaris_models.dart';
import '../../infrastructure/services/polaris_draft_storage.dart';
import 'loan_calculator.dart';
import 'polaris_state.dart';
import 'polaris_notifier.dart';

// Provides the current PolarisSession
final polarisSessionProvider = Provider<PolarisSession>((ref) {
  if (!PolarisSDK.instance.isInitialized) {
    throw Exception('PolarisSDK is not initialized');
  }
  return PolarisSDK.instance.session;
});

// Provides the active loan state, polling or caching
final activeLoanProvider = FutureProvider<ActiveLoan?>((ref) async {
  if (!PolarisSDK.instance.isInitialized) {
    return null;
  }
  final userId = PolarisSDK.instance.session.userId;
  final db = AppDatabase();
  final cacheKey = 'active_loan_$userId';

    try {
      final loan = await PolarisSDK.instance.repository.getActiveLoan(userId);
      if (loan != null) {
        await db.upsertPolarisDraft(
          cacheKey,
          jsonEncode({
            'amount': loan.amount,
            'dueDate': loan.dueDate.toIso8601String(),
          }),
        );
      } else {
        await db.clearPolarisDraft(cacheKey);
      }
      return loan;
    } catch (e) {
      final cached = await db.getPolarisDraft(cacheKey);
      if (cached != null) {
        try {
          final map = jsonDecode(cached);
          return ActiveLoan(
            id: map['id'] ?? 'unknown',
            userId: map['userId'] ?? 'unknown',
            amountOwed: (map['amount'] as num).toDouble(),
            totalRepayable: (map['totalRepayable'] as num?)?.toDouble() ?? 0.0,
            dueDate: DateTime.parse(map['dueDate'] as String),
            disbursedAt: DateTime.parse(map['disbursedAt'] as String? ?? DateTime.now().toIso8601String()),
          );
        } catch (_) {}
    }
    return null;
  }
});

final loanCalculatorParamsProvider =
    StateNotifierProvider<LoanCalculatorNotifier, LoanCalculatorState>((ref) {
      return LoanCalculatorNotifier();
    });

final loanBreakdownProvider = Provider<LoanBreakdown?>((ref) {
  if (!PolarisSDK.instance.isInitialized) return null;

  final params = ref.watch(loanCalculatorParamsProvider);
  final config = PolarisSDK.instance.config;

  return LoanCalculator.calculateBreakdown(
    amount: params.amount,
    termDays: params.termDays,
    config: config,
  );
});

// Provides the PolarisDraftStorage instance
final polarisDraftStorageProvider = Provider<PolarisDraftStorage>((ref) {
  return PolarisDraftStorage();
});

final applicationDraftProvider =
    StateNotifierProvider<ApplicationDraftNotifier, LoanApplicationPayload?>((
      ref,
    ) {
      final storage = ref.watch(polarisDraftStorageProvider);
      return ApplicationDraftNotifier(storage);
    });

// Provides the current step in the application flow (0-5)
final applicationStepProvider = StateProvider<int>((ref) => 0);

final affordabilityProvider = StateProvider<AffordabilityState?>((ref) => null);
