import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/polaris_sdk_core.dart';
import '../../models/data/polaris_models.dart';
import '../../infrastructure/services/polaris_draft_storage.dart';
import 'polaris_state.dart';

class LoanCalculatorNotifier extends StateNotifier<LoanCalculatorState> {
  LoanCalculatorNotifier()
    : super(
        LoanCalculatorState(
          amount: PolarisSDK.instance.isInitialized
              ? PolarisSDK.instance.config.minLoanAmount
              : 0,
          termDays: PolarisSDK.instance.isInitialized
              ? PolarisSDK.instance.config.minTermDays
              : 0,
        ),
      );

  void updateAmount(double amount) {
    state = state.copyWith(amount: amount);
  }

  void updateTerm(int termDays) {
    state = state.copyWith(termDays: termDays);
  }
}

class ApplicationDraftNotifier extends StateNotifier<LoanApplicationPayload?> {
  final PolarisDraftStorage _storage;

  ApplicationDraftNotifier(this._storage) : super(null) {
    _loadDraft();
  }

  Future<void> _loadDraft() async {
    state = await _storage.getDraft();
  }

  Future<void> saveDraft(LoanApplicationPayload payload) async {
    await _storage.saveDraft(payload);
    state = payload;
  }

  Future<void> clearDraft() async {
    await _storage.clearDraft();
    state = null;
  }
}
