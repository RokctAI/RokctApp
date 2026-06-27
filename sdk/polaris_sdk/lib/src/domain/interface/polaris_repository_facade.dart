import '../../models/data/polaris_models.dart';

abstract class PolarisRepositoryFacade {
  Future<LoanEligibility> checkEligibility(String userId);
  Future<LoanApplication> submitApplication(LoanApplicationPayload payload);
  Future<ActiveLoan?> getActiveLoan(String userId);
  Future<LoanApplicationStatus> getApplicationStatus(String applicationId);
  Future<List<LoanTransaction>> getLoanHistory(String userId);
}
