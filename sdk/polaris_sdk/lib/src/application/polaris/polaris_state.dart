class LoanCalculatorState {
  final double amount;
  final int termDays;

  LoanCalculatorState({required this.amount, required this.termDays});

  LoanCalculatorState copyWith({double? amount, int? termDays}) {
    return LoanCalculatorState(
      amount: amount ?? this.amount,
      termDays: termDays ?? this.termDays,
    );
  }
}

class AffordabilityState {
  final double disposableIncome;
  final bool isAffordable;
  final double monthlyIncome;
  final double monthlyExpenses;

  AffordabilityState({
    required this.disposableIncome,
    required this.isAffordable,
    required this.monthlyIncome,
    required this.monthlyExpenses,
  });
}
