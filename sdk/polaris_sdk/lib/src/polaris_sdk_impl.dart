import 'package:core_sdk/core_sdk.dart';
import 'polaris_repository.dart';
import 'models/data/polaris_models.dart';

class LendingSDK {
  final LendingRepository _repository = LendingRepository();

  Future<LendingEligibility> checkEligibility({required double requestedAmount}) async {
    final res = await _repository.checkEligibility(requestedAmount);
    return res.when(
      success: (data) => LendingEligibility(
        isEligible: data['is_eligible'] == true,
        maxAllowedAmount: requestedAmount,
      ),
      failure: (err, status) => LendingEligibility(isEligible: false, maxAllowedAmount: 0),
    );
  }

  Future<String> disburseLoan({required String loanApplicationId}) async {
    final res = await _repository.disburseLoan(loanApplicationId);
    return res.when(
      success: (refId) => refId,
      failure: (err, status) {
        throw Exception(err.toString());
      },
    );
  }

  LendingRepository get repository => _repository;
}
