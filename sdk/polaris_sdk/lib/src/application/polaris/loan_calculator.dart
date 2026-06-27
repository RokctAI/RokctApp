import '../../models/data/polaris_models.dart';

class LoanCalculator {
  /// Pure function to calculate a loan breakdown. No side effects.
  static LoanBreakdown calculateBreakdown({
    required double amount,
    required int termDays,
    required PolarisConfig config,
  }) {
    // 1. Validate inputs against constraints (or clamp them)
    final double safeAmount = amount.clamp(
      config.minLoanAmount,
      config.maxLoanAmount,
    );
    final int safeTerm = termDays.clamp(config.minTermDays, config.maxTermDays);

    // 2. Initiation Fee
    // E.g. NCR cap might say 15% on first 1000, 10% on remainder, etc.
    // For simplicity, using a flat percentage capped at config.maxInitiationFee.
    double initiationFee = safeAmount * config.initiationFeeRate;
    if (initiationFee > config.maxInitiationFee) {
      initiationFee = config.maxInitiationFee;
    }

    // 3. Service Fee (flat rate)
    // Could also be pro-rated, assuming flat for this example.
    double serviceFee = config.serviceFeeFlat;

    // 4. Interest
    // Interest charged on Capital + Initiation Fee (if financed) or just Capital
    // Assuming interest is charged on the requested amount.
    double interest = safeAmount * config.interestRatePerDay * safeTerm;

    // 5. VAT
    // VAT on fees and interest (depending on jurisdiction, often on fees)
    // Let's assume VAT is charged on the Initiation Fee and Service Fee
    double vat = (initiationFee + serviceFee) * config.vatRate;

    // 6. Total Repayable
    double totalRepayable =
        safeAmount + initiationFee + serviceFee + interest + vat;

    // 7. Due Date
    DateTime dueDate = DateTime.now().add(Duration(days: safeTerm));

    return LoanBreakdown(
      capital: safeAmount,
      initiationFee: initiationFee,
      serviceFee: serviceFee,
      interest: interest,
      vat: vat,
      totalRepayable: totalRepayable,
      dueDate: dueDate,
    );
  }
}
