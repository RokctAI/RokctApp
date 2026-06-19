import 'package:flutter/material.dart';
import 'package:core_sdk/core_sdk.dart';
import 'models/data/polaris_models.dart';

class LendingRepository {
  Future<ApiResult<Map<String, dynamic>>> checkEligibility(double amount) async {
    try {
      final client = dioHttp.client(requireAuth: true);
      // Calls check_loan_eligibility on the backend
      final response = await client.get(
        '/api/method/paas.api.lending.lending.check_loan_eligibility',
        queryParameters: {'amount': amount, 'id_number': '12345'},
      );
      return ApiResult.success(data: Map<String, dynamic>.from(response.data['message'] ?? {}));
    } catch (e) {
      debugPrint('==> check eligibility failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }

  Future<ApiResult<String>> disburseLoan(String loanApplicationId) async {
    try {
      final client = dioHttp.client(requireAuth: true);
      final response = await client.post(
        '/api/method/rcore.rlending.api.loan.disburse_loan',
        data: {'loan_application': loanApplicationId},
      );
      return ApiResult.success(data: response.data['message']?.toString() ?? "");
    } catch (e) {
      debugPrint('==> disburse loan failure: $e');
      return ApiResult.failure(
        error: AppHelpers.errorHandler(e),
        statusCode: NetworkExceptions.getDioStatus(e),
      );
    }
  }
}
