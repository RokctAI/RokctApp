class LendingEligibility {
  final bool isEligible;
  final double maxAllowedAmount;

  LendingEligibility({
    required this.isEligible,
    required this.maxAllowedAmount,
  });
}

class FinancialDetails {
  final double monthlyIncome;
  final double monthlyExpenses;

  FinancialDetails({
    required this.monthlyIncome,
    required this.monthlyExpenses,
  });

  Map<String, dynamic> toJson() {
    return {
      'monthly_income': monthlyIncome,
      'monthly_expenses': monthlyExpenses,
    };
  }
}
