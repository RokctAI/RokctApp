import 'dart:math';
import 'package:polaris_sdk/src/models/customer/polaris_models.dart';
import '../../domain/interface/polaris_repository_facade.dart';

class MockPolarisRepositoryImpl implements PolarisRepositoryFacade {
  final Random _random = Random();

  // Simulated backend state
  ActiveLoan? _currentActiveLoan;
  final Map<String, LoanApplication> _applications = {};

  @override
  Future<LoanEligibility> checkEligibility(String userId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    // Provide a simple mock logic
    return LoanEligibility(isEligible: true, maxAllowedAmount: 5000.0);
  }

  @override
  Future<LoanApplication> submitApplication(
    LoanApplicationPayload payload,
  ) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    final String id = 'app_${_random.nextInt(100000)}';

    final app = LoanApplication(
      id: id,
      userId: 'mock_user',
      amount: payload.amount,
      termDays: payload.termDays,
      status: LoanApplicationStatus.pending,
      createdAt: DateTime.now(),
    );

    _applications[id] = app;
    return app;
  }

  @override
  Future<ActiveLoan?> getActiveLoan(String userId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _currentActiveLoan;
  }

  @override
  Future<LoanApplicationStatus> getApplicationStatus(
    String applicationId,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final app = _applications[applicationId];
    if (app != null) {
      // Simulate an approval for the mock repository after some time
      // For simplicity, just return pending or approved randomly
      return LoanApplicationStatus.approved;
    }
    throw Exception('Application not found');
  }

  @override
  Future<List<LoanTransaction>> getLoanHistory(String userId) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [];
  }
}

